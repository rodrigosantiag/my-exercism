import re


def abbreviate(words: str):
    words = re.sub(r"[^a-zA-Z -]", "", words)
    words_list = words.replace("-", " ").split(" ")
    result = ""

    for word in words_list:
        if len(word) > 0:
            result += word[0].upper()

    return result
