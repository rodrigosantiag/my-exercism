import re


def abbreviate(words: str):
    words_list = re.findall(r"[a-zA-Z']+", words)
    result = ""

    for word in words_list:
        result += word[0].upper()

    return result
