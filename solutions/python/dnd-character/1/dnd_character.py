import math
from random import randint

INITIAL_HITPOINT = 10


def modifier(score: int) -> int:
    return math.floor(((score - INITIAL_HITPOINT) / 2))


class Character:
    def __init__(self):
        self.strength = self.ability()
        self.dexterity = self.ability()
        self.constitution = self.ability()
        self.intelligence = self.ability()
        self.wisdom = self.ability()
        self.charisma = self.ability()
        self.hitpoints = INITIAL_HITPOINT + modifier(self.constitution)

    @staticmethod
    def ability() -> int:
        values = [randint(1, 6) for _ in range(4)]
        values.remove(min(values))
        return sum(values)
