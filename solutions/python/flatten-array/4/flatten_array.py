def flatten(iterable):
    return list(recursive_flatten(iterable))


def recursive_flatten(nested_list):
    for item in nested_list:
        if isinstance(item, list):
            yield from recursive_flatten(item)
        elif item is not None:
            yield item
