def equilateral(sides):
    return is_triangle(sides) and len(set(sides)) == 1


def isosceles(sides):
    return is_triangle(sides) and len(set(sides)) <= 2


def scalene(sides):
    return is_triangle(sides) and not isosceles(sides) and not equilateral(sides)


def is_triangle(sides):
    if not any(sides):
        return False

    return sides[0] + sides[1] >= sides[2] and sides[0] + sides[2] >= sides[1] and sides[2] + sides[1] >= sides[0]
