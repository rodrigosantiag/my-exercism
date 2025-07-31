def saddle_points(matrix):
    first_row_size = len(matrix[0]) if matrix else 0

    if any(first_row_size != len(m) for m in matrix):
        raise ValueError("irregular matrix")

    min_column = [min(column) for column in zip(*matrix)]
    result = []

    for idx, row in enumerate(matrix):
        row_max = max(row)

        for jdx, col in enumerate(row):
            if col == row_max and col == min_column[jdx]:
                result.append({"row": idx + 1, "column": jdx + 1})

    return result
