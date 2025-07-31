def egg_count(display_value):
    if display_value == 0:
        return 0

    binary = ""

    while display_value > 0:
        binary = str(display_value % 2) + binary
        display_value //= 2

    return binary.count("1")
