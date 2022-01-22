import sys


class Logging(object):
    def __init__(self):
        self.files = [sys.stdout]

    def add_file(self, file_):
        self.files.append(file_)

    def emit(self, line, raw=False):
        for file_ in self.files:
            file_.write(line)
            if not raw:
                file_.write("\n\r")


logging = Logging()


def _log(line, raw=False):
    logging.emit(line, raw)


def add_log_file(file_):
    logging.add_file(file_)
