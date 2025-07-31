class Allergies:
    def __init__(self, score):
        self.score = score
        self.allergens = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]

    def allergic_to(self, item):
        if self.score == 0:
            return False

        item_idx = self.allergens.index(item)
        item_score = 2**item_idx
        remaining_score = self.score - item_score
        loop_idx = len(self.allergens)

        while loop_idx >= 0:
            if loop_idx != item_idx:
                item_score = 2**loop_idx
                remaining_score = remaining_score - item_score if item_score <= remaining_score else remaining_score

            loop_idx -= 1

        return remaining_score == 0


    @property
    def lst(self):
        result = []

        for item in self.allergens:
            if self.allergic_to(item):
                result.append(item)

        return result
