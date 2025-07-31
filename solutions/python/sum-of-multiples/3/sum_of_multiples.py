def sum_of_multiples(limit, multiples):
    points = set()

    for multiple in multiples:
        if multiple == 0:
            continue

        points.update({number for number in range(multiple, limit, multiple)})

    return sum(points)
