

class FRAMContents(object):
    mapping = {
        2: [
            {
                "version": {
                    "address": 0,
                    "size": 1,
                    "type": int,
                    "default": 2,
                },
            },
            {
                "liters_pumped": {
                    "address": 1,
                    "size": 4,
                    "type": int,
                    "default": 0,
                },
            },
            {
                "pump_on_seconds": {
                    "address": 5,
                    "size": 4,
                    "type": int,
                    "default": 0,
                },
            },
        ],
    }

    def __init__(self, fram, version):
        self.fram = fram
        self.version = version
        self.data = {}

    def read(self):
        pass

    def write(self):
        pass

    def get(self, key, default=None):
        pass

    def set(self, key, value):
        pass