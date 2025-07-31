def saddle_points(matrix):
    if len(set(len(m) for m in matrix)) > 1:
        raise ValueError("irregular matrix")

    result = []
    transposed = list(zip(*matrix))

    for idx, row in enumerate(matrix):
        for jdx, col in enumerate(row):
            if col == max(row) and col == min(transposed[jdx]):
                result.append({"row": idx + 1, "column": jdx + 1})

    return result
