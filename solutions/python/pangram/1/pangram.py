import re

LETTERS_IN_ALPHABET = 26
def is_pangram(sentence):
    sentence = set(re.sub(r"[^a-zA-Z]", "", sentence).lower())

    return len(sentence) == LETTERS_IN_ALPHABET
