def decode(string):
    result = ""
    current_number = ""

    for char in string:
        if char.isdigit():
            current_number += char
        else:
            if not current_number:
                current_number = "1"

            result += int(current_number) * char

            current_number = ""

    return result


def encode(string):
    if not string:
        return ""

    repeated_char = string[0]
    result = ""

    for i in range(1, len(string)):
        if string[i] == string[i-1]:
            repeated_char += string[i]
        else:
            result += f"{len(repeated_char)}{repeated_char[0]}" if len(repeated_char) > 1 else repeated_char[0]
            repeated_char = string[i]

    result += f"{len(repeated_char)}{repeated_char[0]}" if len(repeated_char) > 1 else repeated_char[0]

    return result

# result += f"{count}{string[i]}" if count > 1 else string[i]
