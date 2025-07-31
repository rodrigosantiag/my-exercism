def flatten(iterable):
    return flat_iterable(iterable)


def flat_iterable(iterable):
    result = []

    for item in iterable:
        if item is None:
            continue

        if not isinstance(item, list):
            result.append(item)
        else:
            result += flat_iterable(item)

    return result
