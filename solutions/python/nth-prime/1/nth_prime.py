import math


def prime(number):
    if number < 1:
        raise ValueError("there is no zeroth prime")

    current_number = 1
    count = 0
    result = None

    while count < number:
        if is_prime(current_number):
            count += 1
            result = current_number

        current_number += 1

    return result


def is_prime(number):
    if number <= 1:
        return False
    elif number in (2, 3):
        return True
    if number % 2 == 0 or number % 3 == 0:
        return False

    for factor in range(5, int(math.sqrt(number)) + 1):
        if number % factor == 0:
            return False

    return True
