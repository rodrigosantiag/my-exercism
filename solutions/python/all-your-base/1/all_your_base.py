def rebase(input_base, digits, output_base):
    if input_base < 2:
        raise ValueError("input base must be >= 2")
    if output_base < 2:
        raise ValueError("output base must be >= 2")
    if any(d < 0 or d >= input_base for d in digits):
        raise ValueError("all digits must satisfy 0 <= d < input base")

    if not digits or all(d == 0 for d in digits):
        return [0]

    decimal_number = 0
    for digit in digits:
        decimal_number = decimal_number * input_base + digit

    if decimal_number == 0:
        return [0]

    output_digits = []
    while decimal_number > 0:
        output_digits.append(decimal_number % output_base)
        decimal_number //= output_base

    return output_digits[::-1]
