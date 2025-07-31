def encode(numbers):
    result = []
    for number in numbers:
        if number == 0:
            result.append(0)
            continue
        encoded_bytes = []
        while number > 0:
            encoded_bytes.append(number & 0x7F)
            number >>= 7
        for i in range(len(encoded_bytes) - 1):
            encoded_bytes[i] |= 0x80
        result.extend(reversed(encoded_bytes))
    return result


def decode(bytes_):
    result = []
    current = 0
    for byte in bytes_:
        current = (current << 7) | (byte & 0x7F)
        if byte & 0x80 == 0:
            result.append(current)
            current = 0
    if current != 0:
        raise ValueError("incomplete sequence")
    return result
