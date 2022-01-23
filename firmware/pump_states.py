import time
from utils import _log


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
        self.start_time = 0.0
        self.end_time = 0.0
        self.pump_on_times = []

    def get_on_time(self):
        if not self.pump_on_times:
            return 0.0
        return self.pump_on_times.pop()

    def transition(self, to_state: PumpStates) -> PumpStates:
        if not isinstance(to_state, PumpStates):
            to_state = PumpStates().RESET
            funcname = "_reset"
        else:
            funcname = "_from_%s_to_%s" % (self.state.name, PumpStates(value=to_state).name)

        _log("New State: %s" % PumpStates(value=to_state).name)

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
        _log("New State: IDLE")
        return PumpStates().IDLE

    def _from_pump_to_stop(self) -> PumpStates:
        global pump_en
        pump_en.value(0)
        self.end_time = time.time()
        on_time = self.end_time - self.start_time
        _log("Pump was on for %0.3fs" % on_time)
        self.pump_on_times.append(on_time)
        return self.transition(PumpStates().IDLE)

    def _from_pump_to_no_water(self) -> PumpStates:
        return self.transition(PumpStates().STOP)

    def _from_idle_to_pump(self) -> PumpStates:
        global pump_en
        self.start_time = time.time()
        pump_en.value(1)
        return PumpStates().PUMP

