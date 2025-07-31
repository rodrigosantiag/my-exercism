def find_anagrams(word, candidates):
    result = []
    word = word.lower()
    word_letters = count_letters(word)

    for candidate in candidates:
        candidate_lower = candidate.lower()

        if candidate_lower == word:
            continue

        candidate_letters = count_letters(candidate_lower)

        if word_letters == candidate_letters:
            result.append(candidate)

    return result


def count_letters(word):
    word = word.lower()
    result = {}

    for char in word:
        if char not in result:
            result[char] = 1
        else:
            result[char] += 1

    return result
