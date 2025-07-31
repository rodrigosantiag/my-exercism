def commands(binary_str):
    binary_str = binary_str[::-1]
    actions = ["wink", "double blink", "close your eyes", "jump"]
    result = []

    for idx in (range(len(binary_str))):
        if idx <= 3 and binary_str[idx] == "1":
            result.append(actions[idx])
        elif idx == 4 and binary_str[idx] == "1":
            result.reverse()

    return result
