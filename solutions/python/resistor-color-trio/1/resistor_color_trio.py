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


def label(colors):
    result = VALUES[colors[0]] + VALUES[colors[1]]

    result += "0" * int(VALUES[colors[2]])
    suffix = "ohms"
    prefix = ""

    int_result = int(result)
    final_result = int_result // 10**9 or int_result // 10**6 or int_result // 10**3 or int_result

    if int_result // 10**9:
        prefix = "giga"
    elif int_result // 10**6:
        prefix = "mega"
    elif int_result // 10**3:
        prefix = "kilo"

    return f"{final_result}" + f" {prefix}{suffix}"
