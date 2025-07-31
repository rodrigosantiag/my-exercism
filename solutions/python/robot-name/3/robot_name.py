import string
from random import choices


class Robot:
    def __init__(self):
        self.name = self._generate_name()
        self.used_names = [self.name]

    def name(self):
        return self.name

    def reset(self):
        self.name = self._generate_name()

        if self.name in self.used_names:
            self.reset()

        self.used_names.append(self.name)

        return self

    @staticmethod
    def _generate_name():
        letters = choices(string.ascii_uppercase, k=2)
        numbers = choices(string.digits, k=3)

        return "".join(letters + numbers)
