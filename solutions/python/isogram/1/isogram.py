import re


def is_isogram(string):
    string = re.sub(r"[- ]", "", string).lower()
    string_set = set(string)

    return len(string) == len(string_set)
