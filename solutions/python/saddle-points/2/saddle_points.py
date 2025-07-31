def saddle_points(matrix):
    if any(len(matrix[0]) != len(m) for m in matrix):
        raise ValueError("irregular matrix")

    result = []
    transposed = list(zip(*matrix))

    for idx, row in enumerate(matrix):
        max_value_row = max(row)

        for jdx, col in enumerate(row):
            min_value_col = min(transposed[jdx])

            if col == max_value_row and col == min_value_col:
                result.append({"row": idx + 1, "column": jdx + 1})

    return result
