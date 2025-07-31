def primes(limit):
    if limit < 2:
        return []

    result = []
    numbers = list(range(2, limit + 1))
    marks = [True] * len(numbers)

    for idx, number in enumerate(numbers):
        if marks[idx] is False:
            continue

        result.append(number)
        current_mult = 2

        while number * current_mult <= limit:
            composite = number * current_mult
            composite_idx = numbers.index(composite)
            marks[composite_idx] = False
            current_mult += 1

    return result
