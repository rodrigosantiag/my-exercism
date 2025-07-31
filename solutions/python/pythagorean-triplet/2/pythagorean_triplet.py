def triplets_with_sum(number):
    triplets = []

    for a in range(1, number // 3):
        b = (number * number - 2 * number * a) // (2 * number - 2 * a)
        c = number - a - b

        if a**2 + b**2 == c**2:
            if sorted([a, b, c]) not in triplets:
                triplets.append(sorted([a, b, c]))

    return triplets
