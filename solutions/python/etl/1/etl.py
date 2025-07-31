def transform(legacy_data):
    result = {}

    for point, letters in legacy_data.items():
        for letter in letters:
            result[letter.lower()] = point

    return result
