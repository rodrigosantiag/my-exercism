def saddle_points(matrix):
    first_row_size = len(matrix[0]) if matrix else 0

    if any(first_row_size != len(m) for m in matrix):
        raise ValueError("irregular matrix")

    min_column = [min(column) for column in zip(*matrix)]
    row_candidates = set()
    col_candidates = set()

    for idx, row in enumerate(matrix):
        row_max = max(row)

        for jdx, col in enumerate(row):
            if col == row_max:
                row_candidates.add((idx + 1, jdx + 1))

            if col == min_column[jdx]:
                col_candidates.add((idx + 1, jdx + 1))

    result = [{"row": row, "column": col} for row, col in row_candidates.intersection(col_candidates)]

    return result
