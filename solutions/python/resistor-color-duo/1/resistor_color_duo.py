def value(colors):
    BAND_COLORS = {
        "black": 0,
        "brown": 1,
        "red": 2,
        'orange': 3,
        "yellow": 4,
        "green": 5,
        "blue": 6,
        "violet": 7,
        "grey": 8,
        "white": 9,
    }

    color1, color2 = colors[0:2]

    return int(f"{BAND_COLORS[color1]}{BAND_COLORS[color2]}")
