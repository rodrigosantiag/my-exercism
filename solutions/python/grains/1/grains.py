GRAINS = [1]
[GRAINS.append(GRAINS[i - 1] * 2) for i in range(1, 65)]


def square(number):
    if number > 64 or number < 1:
        raise ValueError("square must be between 1 and 64")

    return 2**(number - 1)


def total():
    return sum(square(i) for i in range(1, 65))
