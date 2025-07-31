# Score categories.
# Change the values as you see fit.
YACHT = "yacht"
ONES = "ones"
TWOS = "twos"
THREES = 'threes'
FOURS = "fours"
FIVES = "fives"
SIXES = "sixes"
FULL_HOUSE = "full_house"
FOUR_OF_A_KIND = "four_of_a_kind"
LITTLE_STRAIGHT = "little_straight"
BIG_STRAIGHT = "big_straight"
CHOICE = "choice"


def score(dice, category):
    yacht = Yacht(dice)

    return getattr(yacht, category)()


class Yacht:
    def __init__(self, dice):
        self.dice = sorted(dice)

    def ones(self):
        return sum([ones for ones in self.dice if ones == 1])

    def twos(self):
        return sum([twos for twos in self.dice if twos == 2])

    def threes(self):
        return sum([threes for threes in self.dice if threes == 3])

    def fours(self):
        return sum([fours for fours in self.dice if fours == 4])

    def fives(self):
        return sum([fives for fives in self.dice if fives == 5])

    def sixes(self):
        return sum([sixes for sixes in self.dice if sixes == 6])

    def full_house(self):
        set_dice = set(self.dice)
        first_element = self.dice[0]

        if len(set_dice) != 2 or self.dice.count(first_element) not in (2, 3):
            return 0

        return sum(self.dice)

    def four_of_a_kind(self):
        first_element = self.dice[0]
        last_element = self.dice[-1]

        if self.dice.count(first_element) >= 4:
            return self.dice[0] * 4

        if self.dice.count(last_element) >= 4:
            return self.dice[-1] * 4

        return 0

    def little_straight(self):
        set_dice = set(self.dice)

        return 30 if sum(self.dice) == 15 and len(set_dice) == 5 else 0

    def big_straight(self):
        set_dice = set(self.dice)

        return 30 if sum(self.dice) == 20 and len(set_dice) == 5 else 0

    def choice(self):
        return sum(self.dice)

    def yacht(self):
        set_dice = set(self.dice)

        return 50 if len(set_dice) == 1 else 0
