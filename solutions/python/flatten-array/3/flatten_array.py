def flatten(iterable):
    result = []

    for item in iterable:
        if item is None:
            continue

        if not isinstance(item, list):
            result.append(item)
        else:
            result += flatten(item)

    return result
