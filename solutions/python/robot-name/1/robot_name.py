import string
from random import choice


class Robot:
    def __init__(self):
        self.name = self._generate_name()
        self.used_name = [self.name]

    def name(self):
        return self.name

    def reset(self):
        self.name = self._generate_name()

        if self.name in self.used_name:
            self.reset()

        self.used_name.append(self.name)

        return self

    @staticmethod
    def _generate_name():
        name = [choice(string.ascii_uppercase) for _ in range(2)]
        name += [str(choice(range(10))) for _ in range(3)]

        return "".join(name)
