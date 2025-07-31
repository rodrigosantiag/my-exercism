CORRESPONDENTS = {
    ")": "(",
    "]": "[",
    "}": "{",
}

def is_paired(input_string):
    opens = CORRESPONDENTS.values()
    closes = CORRESPONDENTS.keys()
    stack = []

    if not input_string:
        return True

    if input_string[0] in closes or input_string[-1] in opens:
        return False

    for char in input_string:
        if char not in opens and char not in closes:
            continue

        if char in opens:
            stack.append(char)
        elif char in closes and stack and stack[-1] == CORRESPONDENTS[char]:
            stack.pop()
        else:
            return False

    return len(stack) == 0
