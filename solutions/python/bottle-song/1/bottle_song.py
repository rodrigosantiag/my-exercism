NUMBERS = {
    10: "Ten",
    9: "Nine",
    8: "Eight",
    7: "Seven",
    6: "Six",
    5: "Five",
    4: "Four",
    3: "Three",
    2: "Two",
    1: "One",
    0: "no",
}

def recite(start, take=1):
    result = []

    while start >= 0 and take > 0:
        start_bottle = "bottles" if start != 1 else "bottle"
        take_bottle = "bottles" if (start - 1) != 1 else "bottle"

        verses = [
            f"{NUMBERS[start]} green {start_bottle} hanging on the wall,",
            f"{NUMBERS[start]} green {start_bottle} hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            f"There'll be {NUMBERS[start-1].lower()} green {take_bottle} hanging on the wall.",
        ]

        for verse in verses:
            result.append(verse)

        start -= 1
        take -= 1

        if take > 0:
            result.append("")

    return result
