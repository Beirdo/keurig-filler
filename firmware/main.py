import time
from enum import Enum
from threading import Lock

from machine import Pin, Timer, ADC


"""
This will be primarily interrupt-driven, and timer driven.
Basic Flow:
    1) Setup the I/Os and IRQ handler
    2) Start a timer to do ADC readings for both level sensors every second
    3) On interrupt from the flow sensor, increment a counter, which we reset every second in the timer handler

Timer Handler:
    1) Read ADC2 to get a ground offset
    2) Read ADC0 to get a level reading at the Keurig's reservoir
    3) Read ADC1 to get a level reading at the 5gal source jug
    4) Read out the flow counter and reset to zero
    5) Update pump control state-machine
    6) Send update out UART (over USB)
"""


class PumpStates(Enum):
    IDLE = 1
    PUMP = 2
    STOP = 3
    NO_WATER = 4
    RESET = 5


class StateMachine(object):
    def __init__(self):
        self.state = PumpStates.IDLE

    def transition(self, to_state: PumpStates) -> PumpStates:
        if not isinstance(to_state, PumpStates):
            to_state = PumpStates.RESET
            funcname = "_reset"
        else:
            funcname = "_from_%s_to_%s" % (self.state.name, to_state.name)

        print("New State: %s" % to_state.name)

        funcname = funcname.lower()

        if not hasattr(self, funcname):
            funcname = "_reset"

        func = getattr(self, funcname)
        if not hasattr(func, "__call__"):
            func = self._reset

        self.state = func()
        return self.state

    def _reset(self) -> PumpStates:
        if self.state == PumpStates.PUMP:
            return self.transition(PumpStates.STOP)
        print("New State: IDLE")
        return PumpStates.IDLE

    def _from_pump_to_stop(self) -> PumpStates:
        global pump_en
        pump_en.value(0)
        return self.transition(PumpStates.IDLE)

    def _from_pump_to_no_water(self) -> PumpStates:
        return self.transition(PumpStates.STOP)

    def _from_idle_to_pump(self) -> PumpStates:
        global pump_en
        pump_en.value(1)
        return PumpStates.PUMP


def scale(value, min_value, max_value, factor=1.0, offset=0.0):
    # clamp value between min_value and max_value
    value = min(max_value, max(min_value, value))

    # Translate to 0-based
    value -= min_value

    # Apply the factor
    value *= factor

    # Apply the offset
    value += offset

    return value


def pulse_irq(pin):
    global flow_count
    with flow_mutex:
        flow_count += 1


flow_mutex = Lock()

pump_en = Pin(22, Pin.OUT)
pump_en.value(0)

flow_count = 0

flow_pulse = Pin(20, Pin.IN, Pin.PULL_DOWN)
flow_pulse.irq(pulse_irq, Pin.IRQ_RISING)

adcs = [ADC(i) for i in range(3)]

# These will need calibrating
level_sensor_min = 2000
level_sensor_max = 5000
flow_factor = 1.0 / 740

# We want this in % level on the sensor
level_sensor_scale = 100.0 * (level_sensor_max - level_sensor_min)

pump_state = StateMachine()

while True:
    with flow_mutex:
        counter = flow_count
        flow_count = 0

    flow = counter * flow_factor

    readings = [adc.read_u16() for adc in adcs]
    keurig_level = scale(readings[0] - readings[2], level_sensor_min, level_sensor_max, level_sensor_scale)
    source_level = scale(readings[1] - readings[2], level_sensor_min, level_sensor_max, level_sensor_scale)

    if pump_state.state == PumpStates.PUMP and flow == 0.0:
        # The pump is on, but no water flowing?!  Shut it off!
        pump_state.transition(PumpStates.STOP)
    elif source_level < 10.0:
        # We are almost out of water.  Stop pumping if we are, and don't start until there's water
        pump_state.transition(PumpStates.NO_WATER)
    elif keurig_level < 5.0:
        # We have source water, and the Keurig is low on water.  Start pumping!
        pump_state.transition(PumpStates.PUMP)
    elif keurig_level > 75.0:
        # The Keurig is getting full enough, we can stop now.
        pump_state.transition(PumpStates.STOP)

    print("State: %s, Keurig Level: %0.2f, Source Level %0.2f, Flow: %0.3f" %
          (pump_state.state.name, keurig_level, source_level, flow))

    time.sleep(1.0)
