import time
import math
import _thread

from machine import Pin, Timer, ADC


"""
This will be primarily interrupt-driven, and timer driven.
Basic Flow:
    1) Setup the I/Os and IRQ handler
    2) Start a timer to do ADC readings for both level sensors every second
    3) On interrupt from the flow sensor, increment a counter, which we reset every second in the timer handler

Timer Handler:
    1) Read ADC0 to get a level reading at the Keurig's reservoir
    2) Read ADC1 to get a level reading at the 5gal source jug
    3) Read out the flow counter and reset to zero
    4) Update pump control state-machine
    5) Send update out UART (over USB)
"""


class PumpStates(object):
    states = {
        1: "IDLE",
        2: "PUMP",
        3: "STOP",
        4: "NO_WATER",
        5: "RESET",
    }
 
    states_by_name = {value: key for (key, value) in states.items()}
    
    def __init__(self, state=None, value=None):
        if state is not None:
            value = getattr(self, state)
            
        if value is not None:
            if value in self.states.keys():
                self.value = value
            else:
                raise KeyError("No state maps out to value %s" % value)
    
    def __getattr__(self, state):
        if state == "name":
            attr = self.states.get(self.value, None)
            if not attr:
                raise KeyError("State with value %s does not exist" % self.value)
            return attr
            
        attr = self.states_by_name.get(state.upper(), None)
        if not attr:
            raise KeyError("State %s does not exist" % state)
        return attr
    

class StateMachine(object):
    def __init__(self):
        self.state = PumpStates("IDLE")

    def transition(self, to_state: PumpStates) -> PumpStates:
        if not isinstance(to_state, PumpStates):
            to_state = PumpStates().RESET
            funcname = "_reset"
        else:
            funcname = "_from_%s_to_%s" % (self.state.name, PumpStates(value=to_state).name)

        print("New State: %s" % PumpStates(value=to_state).name)

        funcname = funcname.lower()

        if not hasattr(self, funcname):
            funcname = "_reset"

        func = getattr(self, funcname)
        if not hasattr(func, "__call__"):
            func = self._reset

        self.state = func()
        return self.state

    def _reset(self) -> PumpStates:
        if self.state == PumpStates().PUMP:
            return self.transition(PumpStates().STOP)
        print("New State: IDLE")
        return PumpStates().IDLE

    def _from_pump_to_stop(self) -> PumpStates:
        global pump_en
        pump_en.value(0)
        return self.transition(PumpStates().IDLE)

    def _from_pump_to_no_water(self) -> PumpStates:
        return self.transition(PumpStates().STOP)

    def _from_idle_to_pump(self) -> PumpStates:
        global pump_en
        pump_en.value(1)
        return PumpStates().PUMP


scale_a = math.log(2.053)
scale_b = math.log(0.9989)


def scale_liquid_level(value):
    print("%03X" % value)
    
    '''
    First we need to calculate the resistance, much like one would with a
    thermistor.   We create a resistive voltage divider with a resistor going
    from the ADC input to ground.  I have chosen a 1k resistor as it seemed to
    be relatively similar to much of the range.
    
    In the end the resistance vs level graph is an exponential decay that looks
    very much like the ones for NTD thermistors
    '''
    r = 1000
    vin = 3.3
    vo = 3.3 * value / 4096
    r_sensor = r * ((vin / vo) - 1)
    print("%0.3f ohm" % r_sensor)

    '''
    Now, let's calibrate this (using emperically determined values).  At 100% we
    see around 700 ohms, and at 1% (just starting to trigger) it's around 4k ohms.
    When the sensor is completely dry, it gets to around 100k ohms.  We'll cap the
    measured value
    '''
    sensor_min_r = 700
    sensor_max_r = 4000
    sensor_r_range = sensor_max_r - sensor_min_r
    
    r_sensor = min(sensor_max_r, max(sensor_min_r, r_sensor))
    print("%0.3f ohm" % r_sensor)
    
    '''
    We are going to use exponential regression (two layers deep) to find
    the % full based on:
        x       y = R
        0       4000
        25      1150
        50      800
        75      720
        100     700
        
    After the first logarithm:
        x        y1 = ln(y)
        0        8.294049
        25       7.047517
        50       6.684612
        75       6.579251
        100      6.55108
        
    This is still clearly somewhat exponential.
    
    After the second logarithm:
        x        y2 = ln(y1)
        0        2.115538
        25       1.952675
        50       1.899808
        75       1.883921
        100      1.87963
        
    This maps out to:
       y2 = a * b^x
       with a = 2.053, b = 0.9989
         
       y2 = 2.053 * 0.9989^x
    
        x = (ln(y2) - ln(a)) / ln(b)
    '''

    y1 = math.log(r_sensor)
    y2 = math.log(y1)
    y3 = math.log(y2)
    percent_value = max(0, (y3 - scale_a) / scale_b)
    print("Scaled %%: %0.3f" % percent_value)
    return percent_value
    

def pulse_irq(pin):
    global flow_count
    with flow_mutex:
        flow_count += 1


flow_mutex = _thread.allocate_lock()

pump_en = Pin(22, Pin.OUT)
pump_en.value(0)

flow_count = 0

flow_pulse = Pin(20, Pin.IN, Pin.PULL_DOWN)
flow_pulse.irq(pulse_irq, Pin.IRQ_RISING)

flow_factor = 1.0 / 740

pump_state = StateMachine()
loop_counter = 0

while True:
    with flow_mutex:
        counter = flow_count
        flow_count = 0

    flow = counter * flow_factor

    loop_counter += 1

    '''
    MicroPython has some stupid method of expanding to 16 bit values which is not linear.  We will use the
    original 12bit ADC readings, thanks.  Also, since these sensors are finnicky, average over 8 values.
    '''
    keurig_levels = [ADC(0).read_u16() for i in range(8)]
    print("Keurig: %s" % list(map(lambda x: "%04X" % x, keurig_levels)))
    keurig_level = scale_liquid_level(sum(keurig_levels) >> 7)
    
    source_levels = [ADC(1).read_u16() for i in range(8)]
    print("Source: %s" % list(map(lambda x: "%04X" % x, source_levels)))
    source_level = scale_liquid_level(sum(source_levels) >> 7)

    if pump_state.state == PumpStates().PUMP and flow == 0.0:
        # The pump is on, but no water flowing?!  Shut it off!
        pump_state.transition(PumpStates().STOP)
    elif source_level < 10.0:
        # We are almost out of water.  Stop pumping if we are, and don't start until there's water
        pump_state.transition(PumpStates().NO_WATER)
    elif keurig_level < 5.0:
        # We have source water, and the Keurig is low on water.  Start pumping!
        pump_state.transition(PumpStates().PUMP)
    elif keurig_level > 75.0:
        # The Keurig is getting full enough, we can stop now.
        pump_state.transition(PumpStates().STOP)

    print("%s: State: %s, Keurig Level: %0.2f, Source Level %0.2f, Flow: %0.3f" %
          (loop_counter, PumpStates(value=pump_state.state).name, keurig_level, source_level, flow))

    time.sleep(1.0)
