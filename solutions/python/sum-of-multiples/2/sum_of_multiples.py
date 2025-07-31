def sum_of_multiples(limit, multiples):
    points = set()

    for multiple in multiples:
        if multiple == 0:
            continue

        for number in range(multiple, limit, multiple):
            points.add(number)

    return sum(points)
