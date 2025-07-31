ALPHABET = "abcdefghijklmnopqrstuvwxyz"


def rotate(text, key):
    result = ""

    for char in text:
        lower_char = char.lower()

        if lower_char not in ALPHABET:
            result += char
            continue

        text_index = ALPHABET.index(lower_char)
        next_index = text_index + key - len(ALPHABET)

        result += ALPHABET[next_index].upper() if char.isupper() else ALPHABET[next_index]

    return result
