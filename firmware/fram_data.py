from cbor import cbor
from utils import _log


class FRAMSettings(object):
    def __init__(self, filename, version):
        self.filename = filename
        self.version = version
        self.data = {"version": version}
        self._dirty = True
        self.read()

    def read(self):
        try:
            with open(self.filename, "rb") as f:
                self.data = cbor.load(f)
                self._dirty = False
        except Exception as e:
            _log("ERROR, cannot read CBOR from FRAM: %s" % e)
            self.data = {"version": self.version}
            self._dirty = True

    def write(self, force=False):
        if force or self._dirty:
            try:
                with open(self.filename, "wb") as f:
                    cbor.dump(self.data, f, sort_keys=True)
                    self._dirty = False
            except Exception as e:
                _log("ERROR, cannot write CBOR to FRAM: %s" % e)

    def get(self, key, default=None):
        return self.data.get(key, default)

    def set(self, key, value):
        oldvalue = self.get(key, None)
        if oldvalue is not None and oldvalue == value:
            return
        self.data[key] = value
        self._dirty = True
