import re

def is_valid(isbn):
    isbn = isbn.upper().replace("-", "")

    if not re.match(r"^\d{9}[\dX]$", isbn):
        return False

    result = 0
    factor = 10

    for char in isbn:
        try:
            result += int(char) * factor
        except ValueError:
            result += 10 * factor

        factor -= 1

    return result % 11 == 0
