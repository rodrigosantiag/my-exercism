import re

ALPHABET = "abcdefghijklmnopqrstuvwxyz"
CIPHER = ALPHABET[::-1]
TRANSLATION = str.maketrans(ALPHABET, CIPHER)
GROUP_SIZE = 5


def encode(plain_text):
    plain_text = sanitize_input(plain_text)
    result = ""
    counter = 0

    for char in plain_text:
        counter += 1
        result += char.translate(TRANSLATION)

        if counter == GROUP_SIZE:
            result += " "
            counter = 0

    return result.strip()


def decode(ciphered_text):
    ciphered_text = sanitize_input(ciphered_text)

    return ciphered_text.translate(TRANSLATION)


def sanitize_input(input):
    pattern = r"[^A-Za-z0-9]+"
    result = re.sub(pattern, "", input.lower())

    return result
