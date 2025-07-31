def spiral_matrix(size):
    initial_value = 0
    result = [[0 for _ in range(size)] for _ in range(size)]
    start_row, end_row = 0, size - 1
    start_col, end_col = 0, size - 1

    while start_row <= end_row and start_col <= end_col:
        for col in range(start_col, end_col + 1):
            initial_value += 1
            result[start_row][col] = initial_value

        for row in range(start_row + 1, end_row + 1):
            initial_value += 1
            result[row][end_col] = initial_value

        for col in reversed(range(start_col, end_col)):
            if start_row == end_row:
                break

            initial_value += 1
            result[end_row][col] = initial_value

        for row in reversed(range(start_row + 1, end_row)):
            if start_col == end_col:
                break

            initial_value += 1
            result[row][start_col] = initial_value

        start_row += 1
        end_row -= 1
        start_col += 1
        end_col -= 1

    return result
