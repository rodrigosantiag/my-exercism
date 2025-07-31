def append(list1, list2):
    return [item1 for item1 in list1] + [item2 for item2 in list2]


def concat(lists):
    result = []

    for item in lists:
        if isinstance(item, list):
            result.extend(item)
        else:
            result.append(item)

    return result


def filter(function, list):
    return [i for i in list if function(i)]


def length(list):
    return len(list)


def map(function, list):
    return [function(i) for i in list]


def foldl(function, list, initial):
    while list:
        initial = function(initial, list.pop(0))

    return initial


def foldr(function, list, initial):
    while list:
        initial = function(initial, list.pop())

    return initial


def reverse(list):
    return list[::-1]
