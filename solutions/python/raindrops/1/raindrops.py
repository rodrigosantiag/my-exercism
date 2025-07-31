def convert(number):
    factor_3 = number % 3 == 0
    factor_5 = number % 5 == 0
    factor_7 = number % 7 == 0

    if not any([factor_3, factor_5, factor_7]):
        return str(number)

    result = ""

    if factor_3:
        result += "Pling"

    if factor_5:
        result += "Plang"

    if factor_7:
        result += "Plong"

    return result
