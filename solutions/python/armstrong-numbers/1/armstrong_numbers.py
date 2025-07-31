def is_armstrong_number(number):
    number_str = str(number)
    total = 0

    for digit in number_str:
        digit = int(digit)

        total += digit ** len(number_str)

    return total == number
