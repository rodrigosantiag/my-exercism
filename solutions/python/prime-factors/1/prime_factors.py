def factors(value):
    result = []
    divisor = 2

    while divisor <= value:
        if value % divisor == 0:
            result.append(divisor)
            value //= divisor
        else:
            divisor += 1

    return result
