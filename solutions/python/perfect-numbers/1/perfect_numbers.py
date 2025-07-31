def classify(number):
    if number <= 0:
        raise ValueError("Classification is only possible for positive integers.")

    result = 0

    for i in range(1, number):
        if number % i == 0:
            result += i

        if result > number:
            return "abundant"

    return "deficient" if result < number else "perfect"
