def annotate(minefield: list[str]) -> list[str]:
    result = []

    if not minefield:
        return result

    if len(set(len(row) for row in minefield)) > 1:
        raise ValueError("The board is invalid with current input.")

    if any(not set(row).issubset(" *") for row in minefield):
        raise ValueError("The board is invalid with current input.")

    for row in range(len(minefield)):
        new_row = ""

        for col in range(len(minefield[0])):
            if minefield[row][col] == " ":
                new_row += count_mines(minefield, row, col)
            else:
                new_row += minefield[row][col]

        result.append(new_row)

    return result


def count_mines(minefield: list[str], row: int, col: int) -> str:
    result = 0
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0), (-1, -1), (-1, 1), (1, -1), (1, 1)]

    for dr, dc in directions:
        if 0 <= row + dr < len(minefield) and 0 <= col + dc < len(minefield[0]):
            result += minefield[row + dr][col + dc] == "*"

    if result:
        return str(result)

    return " "
