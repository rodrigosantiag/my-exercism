def sum_of_multiples(limit, multiples):
    points = set()

    for multiple in multiples:
        if multiple == 0:
            continue

        factor = 1

        while multiple * factor < limit:
            points.add(multiple * factor)
            factor += 1

    return sum(points)
