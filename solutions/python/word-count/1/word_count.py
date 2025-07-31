import re


def count_words(sentence):
    result = {}
    words = re.findall(r"\b([A-Za-z0-9]+(?:'?[A-Za-z0-9]+)*)\b", sentence.replace("_", " "))

    for word in words:
        word = word.lower()

        if word not in result:
            result[word] = 1
        else:
            result[word] += 1

    return result
