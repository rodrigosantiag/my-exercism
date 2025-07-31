VERSES = [
    ("first", "a Partridge in a Pear Tree"),
    ("second", "two Turtle Doves"),
    ("third", "three French Hens"),
    ("fourth", "four Calling Birds"),
    ("fifth", "five Gold Rings"),
    ("sixth", "six Geese-a-Laying"),
    ("seventh", "seven Swans-a-Swimming"),
    ("eighth", "eight Maids-a-Milking"),
    ("ninth", "nine Ladies Dancing"),
    ("tenth", "ten Lords-a-Leaping"),
    ("eleventh", "eleven Pipers Piping"),
    ("twelfth", "twelve Drummers Drumming"),
]

def recite(start_verse, end_verse):
    result = []

    for idx in range(start_verse - 1, end_verse):
        ordinal, item = VERSES[idx]

        current_verse = f"On the {ordinal} day of Christmas my true love gave to me: "
        items = []

        while idx >= 0:
            items.append(f"{VERSES[idx][1]}")

            idx -= 1

        if len(items) == 1:
            current_verse += "".join(items)
        else:
            last_item = items.pop()
            current_verse += ", ".join(items)
            current_verse += f", and {last_item}"

        result.append(current_verse + ".")

    return result
