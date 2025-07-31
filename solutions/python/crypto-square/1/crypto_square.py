import re


def cipher_text(plain_text: str) -> str:
    plain_text = re.sub(r'[^a-zA-Z0-9]', '', plain_text).lower()

    if not plain_text:
        return ""

    squared_text = build_square(plain_text)

    rows = len(squared_text)
    columns = len(squared_text[0])

    transposed_matrix = ["".join([squared_text[row][column] for row in range(rows)]) for column in range(columns)]

    return " ".join(transposed_matrix)


def build_square(text: str) -> list[str]:
    text_length = len(text)
    row = column = 0

    while True:
        condition = row * column >= text_length and column >= row and column - row <= 1

        if condition:
            break

        if column == row:
            column += 1

        if column - row >= 1:
            row += 1

    result = [text[col:col + column].ljust(column, " ") for col in range(0, text_length, column)]

    return result
