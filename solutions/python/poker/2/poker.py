from enum import Enum

CARDS_HIERARCHY = {
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "10": 10,
    "J": 11,
    "Q": 12,
    "K": 13,
    "A": 14,
}


class CardSet(Enum):
    HIGH_CARD = 1
    ONE_PAIR = 2
    TWO_PAIR = 3
    THREE_OF_A_KIND = 4
    STRAIGHT = 5
    FLUSH = 6
    FULL_HOUSE = 7
    FOUR_OF_A_KIND = 8
    STRAIGHT_FLUSH = 9


def best_hands(hands):
    current_win_hand = 0
    result = []
    highest_cards = []

    for hand in hands:
        current_hand = Hand(hand)
        current_hand_set = current_hand.card_set
        highest_cards.append(current_hand.highest_card)
        if current_hand_set > current_win_hand:
            current_win_hand = current_hand_set
            result = [hand]
        elif current_hand_set == current_win_hand and current_hand_set != 1:
            result.append(hand)

    if current_win_hand == 1:
        highest_card = max(highest_cards)
        result = [hand for idx, hand in enumerate(hands) if highest_cards[idx] == highest_card]

    if len(result) > 1:
        result = untie(result)

    return result


def untie(hands: list[str]) -> list[str]:
    result = []
    hand_objects = [Hand(hand) for hand in hands]

    hand_card_set = max([hand.card_set for hand in hand_objects])

    if hand_card_set == 7:
        return untie_full_house(hand_objects)
    elif hand_card_set == 8:
        return untie_four_of_a_kind(hand_objects)
    else:
        return untie_general(hand_objects)


def untie_general(hand_objects: list[lambda: Hand]) -> list[str]:
    result = []
    hand_card_values = [hand.card_values for hand in hand_objects]

    for item in hand_card_values:
        item.reverse()

    max_card_value = max(hand_card_values)

    for idx, card_values in enumerate(hand_card_values):
        if card_values == max_card_value:
            result.append(hand_objects[idx].hand)

    return result


def untie_full_house(hands: list[lambda: Hand]) -> list[str]:
    max_value = 0
    result = []

    for hand in hands:
        card_count = hand.card_count
        max_card = max(card_count, key=card_count.get)
        max_card = CARDS_HIERARCHY[max_card]

        if max_card > max_value:
            result = [hand.hand]
            max_value = max_card

    return result


def untie_four_of_a_kind(hands: list[lambda: Hand]) -> list[str]:
    max_value = 0
    result = []

    for hand in hands:
        card_count = hand.card_count
        max_card = max(card_count, key=card_count.get)
        max_card = CARDS_HIERARCHY[max_card]

        if max_card > max_value:
            result = [hand.hand]
            max_value = max_card
        elif max_card == max_value:
            return untie_general(hands)

    return result


class Hand:
    def __init__(self, hand):
        self.hand = hand
        self.cards = self.hand.split()
        self.card_numbers = [card[0:-1] for card in self.cards]
        self.card_values = sorted([CARDS_HIERARCHY[card] for card in self.card_numbers])
        self.highest_card = max([CARDS_HIERARCHY[card] for card in self.card_numbers])
        self.card_symbols = [card[-1] for card in self.cards]
        self.card_count = self._count_cards()
        self.card_set = self._set_card_set()

    def _sequence(self) -> bool:
        difference = self.card_values[-1] - self.card_values[0]

        if difference == 4:
            return True
        elif self.card_values[:-1] == [2, 3, 4, 5] and self.card_values[-1] == 14:
            self.card_values[-1] = 1
            return True

        return False

    def _all_symbols_equal(self) -> bool:
        return len(set(self.card_symbols)) == 1

    def _count_cards(self) -> dict[str, int]:
        result = {}

        for card in self.card_numbers:
            if card in result:
                result[card] += 1
            else:
                result[card] = 1

        return result

    def _set_card_set(self) -> int:
        sequence = self._sequence()
        all_equal = self._all_symbols_equal()
        count_cards = self._count_cards()

        if sequence and all_equal:
            return CardSet.STRAIGHT_FLUSH.value

        if 4 in count_cards.values():
            return CardSet.FOUR_OF_A_KIND.value

        if 3 in count_cards.values() and 2 in count_cards.values():
            return CardSet.FULL_HOUSE.value

        if all_equal:
            return CardSet.FLUSH.value

        if 3 in count_cards.values():
            return CardSet.THREE_OF_A_KIND.value

        if sorted(count_cards.values()) == [1, 2, 2]:
            return CardSet.TWO_PAIR.value

        if sorted(count_cards.values()) == [1, 1, 1, 2]:
            return CardSet.ONE_PAIR.value

        if sequence:
            return CardSet.STRAIGHT.value

        return CardSet.HIGH_CARD.value
