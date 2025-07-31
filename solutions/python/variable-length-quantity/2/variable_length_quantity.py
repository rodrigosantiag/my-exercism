MORE = 0b10000000
MASK = 0b01111111


def encode(numbers: list[int]) -> list[int]:
    results = []

    for number in numbers:
        encoded: list[int] = []

        while number:
            encoded.append(MORE | (number & MASK))
            number >>= 7

        if not encoded:
            encoded.append(0)

        encoded[0] &= MASK
        results.extend(reversed(encoded))

    return results


def decode(encoded: list[int]) -> list[int]:
    if encoded[-1] & MORE:
        raise ValueError("incomplete sequence")

    decoded: list[int] = []
    num = 0

    for chunk in encoded:
        num = (num << 7) | (chunk & MASK)

        if not chunk & MORE:
            decoded.append(num)
            num = 0

    return decoded
