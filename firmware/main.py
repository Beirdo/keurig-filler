import _thread
import math
import os
import time

from machine import Pin, ADC, SPI, I2C, UART, Signal

from eeprom.fram.fram_spi import FRAM
from fram_data import FRAMSettings
from lcd_handler import LCDHandler
from pump_states import StateMachine, PumpStates
from utils import _log, add_log_file

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

scale_a = math.log(2.053)
scale_b = math.log(0.9989)


def scale_liquid_level(value):
    _log("%03X" % value)

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
    _log("%0.3f ohm" % r_sensor)

    '''
    Now, let's calibrate this (using empirically determined values).  At 100% we
    see around 700 ohms, and at 1% (just starting to trigger) it's around 4k ohms.
    When the sensor is completely dry, it gets to around 100k ohms.  We'll cap the
    measured value
    '''
    sensor_min_r = 700
    sensor_max_r = 4000
    sensor_r_range = sensor_max_r - sensor_min_r

    r_sensor = min(sensor_max_r, max(sensor_min_r, r_sensor))
    _log("%0.3f ohm" % r_sensor)

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
    percent_value = max(0.0, (y3 - scale_a) / scale_b)
    _log("Scaled %%: %0.3f" % percent_value)
    return percent_value


def pulse_irq(pin):
    global flow_count
    with flow_mutex:
        flow_count += 1


keurig_level = 0.0
source_level = 0.0
pump_on_seconds = 0.0
liters_pumped = 0.0

display_vars = {
    "keurig_level": 0.0,
    "source_level": 0.0,
    "liters_pumped": 0,
    "pump_on_seconds": 0,
}

display_items = [
    {
        "x": 0,
        "y": 0,
        "static": "Keurig:",
    },
    {
        "x": 7,
        "y": 0,
        "format": "%03.1%%",
        "variable": "keurig_level",
        "clear_to_eol": True,
    },
    {
        "x": 0,
        "y": 1,
        "static": "Source:",
    },
    {
        "x": 7,
        "y": 1,
        "format": "%03.1%%",
        "variable": "source_level",
        "clear_to_eol": True,
    },
    {
        "x": 0,
        "y": 2,
        "static": "Pumped:",
    },
    {
        "x": 7,
        "y": 2,
        "format": "%12dL",
        "variable": "liters_pumped",
        "clear_to_eol": True,
    },
    {
        "x": 0,
        "y": 3,
        "static": "Time:",
    },
    {
        "x": 7,
        "y": 4,
        "format": "%12ds",
        "variable": "pump_on_seconds",
        "clear_to_eol": True,
    },
]


def update_lcd_display(lcd: LCDHandler):
    for item in display_items:
        if "static" in item:
            str_ = item.get("static", "")
        else:
            value = display_vars.get(item.get("variable", None), 0)
            str_ = item.get("format", "") % value
        lcd.put_str(str_, item.get("x", -1), item.get("y", -1), item.get("clear_to_eol", False))
    lcd.refresh()


flow_mutex = _thread.allocate_lock()

v2_detect = Pin(28, Pin.IN, Pin.PULL_UP).value()
if not v2_detect:
    version = 1
    fram_settings = None
    lcd = None
else:
    # Hookup the HC-05 on UART0
    uart_key_pin = Pin(14, Pin.OPEN_DRAIN, value=1)
    uart_key = Signal(uart_key_pin, invert=True)
    uart_key.off()
    
    uart = UART(0, baudrate=115200, rx=Pin(13), tx=Pin(12))
    add_log_file(uart)

    # Hook up the FRAM on SPI0
    supported_version = 2
    spi = SPI(0, baudrate=25_000_000, polarity=0, phase=0, sck=Pin(18), mosi=Pin(19), miso=Pin(16))
    spi_cs0 = Pin(17, Pin.OUT, value=1)
    fram = FRAM(spi, [spi_cs0], size=64)
    # Only need to run this once!
    # os.VfsLfs2.mkfs(fram)
    os.mount(fram, "/fram")
    fram_settings = FRAMSettings("/fram/settings.cbor", supported_version)

    version = fram_settings.get("version", supported_version)
    liters_pumped = fram_settings.get("liters_pumped", 0.0)
    pump_on_seconds = fram_settings.get("pump_on_seconds", 0.0)

    # Hook up the LCD on I2C0
    i2c = I2C(0, scl=Pin(7), sda=Pin(6))
    # Only need to run this once to get the right addr
    # i2c.scan()
    lcd = LCDHandler(i2c, 0x27)

pump_pin = Pin(22, Pin.OUT, value=0)
pump_en = Signal(pump_pin, invert=False)

flow_count = 0

flow_pulse = Pin(20, Pin.IN, Pin.PULL_DOWN)
flow_pulse.irq(pulse_irq, Pin.IRQ_RISING)

flow_factor = 1.0 / 740

pump_state = StateMachine()
loop_counter = 0

total_flow = 0.0
instance_flow = 0.0

while True:
    with flow_mutex:
        counter = flow_count
        flow_count = 0

    flow = counter * flow_factor
    instance_flow += flow
    if version >= 2:
        liters_pumped += flow
        fram_settings.set("liters_pumped", liters_pumped)

    loop_counter += 1

    '''
    MicroPython has some stupid method of expanding to 16 bit values which is not linear.  We will use the
    original 12bit ADC readings, thanks.  Also, since these sensors are finnicky, average over 8 values.
    '''
    keurig_levels = [ADC(0).read_u16() for i in range(8)]
    _log("Keurig: %s" % list(map(lambda x: "%04X" % x, keurig_levels)))
    keurig_level = scale_liquid_level(sum(keurig_levels) >> 7)

    source_levels = [ADC(1).read_u16() for i in range(8)]
    _log("Source: %s" % list(map(lambda x: "%04X" % x, source_levels)))
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

    on_time = pump_state.get_on_time()
    if on_time:
        _log("Water pumped: %0.3fL" % instance_flow)
        instance_flow = 0.0

        if version >= 2:
            pump_on_seconds += on_time
            fram_settings.set("pump_on_seconds", pump_on_seconds)

    _log("%s: State: %s, Keurig Level: %0.2f, Source Level %0.2f, Flow: %0.3f" %
         (loop_counter, PumpStates(value=pump_state.state).name, keurig_level, source_level, flow))

    if version >= 2:
        display_vars.update({
            "keurig_level": keurig_level,
            "source_level": source_level,
            "liters_pumped": int(liters_pumped),
            "pump_on_seconds": int(pump_on_seconds),
        })
        update_lcd_display(lcd)

    time.sleep(1.0)
