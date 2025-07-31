MIN_NUMBER = 0
MAX_NUMBER = 1e12

ONES = [
    "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
    "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
]

TENS = [
    None, None, "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
]

BASES = (
    (1e9, 'billion'),
    (1e6, 'million'),
    (1e3, 'thousand'),
    (1e2, 'hundred'),
)


def say(number):
    if not MIN_NUMBER <= number < MAX_NUMBER:
        raise ValueError("input out of range")

    if number == 0:
        return "zero"

    result = []

    for base, name in BASES:
        if number >= base:
            result.append(say(int(number // base)))
            result.append(name)
            number = int(number % base)

    output = ""

    if number >= 20:
        output += TENS[number // 10]
        number = int(number % 10)

        if number:
            output += "-"

    if number and number < 20:
        output += ONES[number]

    if output:
        result.append(output)

    return " ".join(result)
