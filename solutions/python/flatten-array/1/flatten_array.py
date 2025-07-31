def flatten(iterable):
    return flat_iterable(iterable, [])


def flat_iterable(iterable, current_list):
    for item in iterable:
        if item is not None and not isinstance(item, list):
            current_list.append(item)
        elif isinstance(item, list):
            flat_iterable(item, current_list)

    return current_list
