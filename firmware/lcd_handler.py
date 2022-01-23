from lcd.pico_i2c_lcd import I2cLcd


class LCDHandler(object):
    rows = 4
    columns = 20
    default_i2c_addr = 0x27

    def __init__(self, i2c, i2c_addr=None):
        self.cache = None
        self.cursor = None
        self.i2c = i2c
        if not i2c_addr:
            i2c_addr = self.default_i2c_addr
        self.i2c_addr = i2c_addr
        self.lcd = I2cLcd(self.i2c, self.i2c_addr, self.rows, self.columns)
        self.lcd.hide_cursor()
        self.clear()
        self.lcd.display_on()
        self.lcd.backlight_on()

    def clear(self):
        self.lcd.clear()
        self.cache = [[{"char": " ", "dirty": False} for i in range(self.columns)] for j in range(self.rows)]

    def refresh(self, force=False):
        prev = [-1, -1]
        for (row, row_item) in enumerate(self.cache):
            for (col, item) in enumerate(row_item):
                if force or item.get("dirty", False):
                    cursor = [col, row]
                    if prev != [col - 1, row]:
                        self.lcd.move_to(*cursor)
                    prev = cursor
                    self.lcd.putchar(item.get("char", " "))
                    item["dirty"] = False

    def clear_row(self, row):
        if row not in range(self.rows):
            return

        map(lambda x: self._update_ch(x, " "), self.cache[row])

    def put_str(self, str_, x, y, clear_to_eol=False):
        if y not in range(self.rows) or x not in range(self.columns):
            return

        strlen = min(len(str_), self.columns - x)
        row_item = self.cache[y]
        map(lambda col: self._update_ch(row_item[x + col], str_[col]), range(strlen))

        if clear_to_eol:
            x += strlen
            map(lambda col: self._update_ch(row_item[x + col], " "), range(self.columns - x))

    @staticmethod
    def _update_ch(item, ch):
        if item.get("char", " ") != ch:
            item["char"] = ch
            item["dirty"] = True

    def put_char(self, char, x, y):
        if y not in range(self.rows) or x not in range(self.columns):
            return

        self._update_ch(self.cache[y][x], char)
