VALUES = {
    "black": "0",
    "brown": "1",
    "red": "2",
    "orange": "3",
    "yellow": "4",
    "green": "5",
    "blue": "6",
    "violet": "7",
    "grey": "8",
    'white': "9",
}

PRECISION = {
    "grey": "0.05",
    "violet": "0.1",
    "blue": "0.25",
    "green": "0.5",
    "brown": "1",
    "red": "2",
    "gold": "5",
    "silver": "10",
}


def resistor_label(colors):
    if len(colors) == 1:
        return VALUES[colors[0]] + " ohms"
    elif len(colors) == 4:
        value_1, value_2, value_3, multiplier, tolerance = (
            VALUES[colors[0]], VALUES[colors[1]], "", VALUES[colors[2]], PRECISION[colors[3]]
        )
    else:
        value_1, value_2, value_3, multiplier, tolerance = (
            VALUES[colors[0]], VALUES[colors[1]], VALUES[colors[2]], VALUES[colors[3]], PRECISION[colors[4]]
        )

    result = value_1 + value_2 + value_3

    result += "0" * int(multiplier)
    suffix = "ohms"
    prefix = ""

    int_result = int(result)
    final_result = int_result

    if int_result // 10**9:
        final_result = int_result / 10**9
        prefix = "giga"
    elif int_result // 10**6:
        final_result = int_result / 10**6
        prefix = "mega"
    elif int_result // 10**3:
        final_result = int_result / 10**3
        prefix = "kilo"

    if int(final_result) == final_result:
        final_result = int(final_result)

    suffix += f" ±{tolerance}%"

    return f"{final_result}" + f" {prefix}{suffix}"
