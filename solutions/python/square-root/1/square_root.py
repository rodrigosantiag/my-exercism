def square_root(number):
    result = 0
    equation = result**2 - number

    while equation != 0:
        result += 1
        equation = result**2 - number

    return result
