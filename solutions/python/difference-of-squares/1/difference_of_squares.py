def square_of_sum(number):
    return sum(range(number+1))**2


def sum_of_squares(number):
    squares = [n**2 for n in range(number+1)]

    return sum(squares)


def difference_of_squares(number):
    return square_of_sum(number) - sum_of_squares(number)
