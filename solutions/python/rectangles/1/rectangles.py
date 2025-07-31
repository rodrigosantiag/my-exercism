def rectangles(diagram):
    if not diagram or not diagram[0]:
        return 0

    rows = diagram
    height = len(rows)
    width = len(rows[0])
    corners = [(r, c) for r in range(height) for c in range(width) if rows[r][c] == '+']
    rectangles_count = 0

    for i in range(len(corners)):
        for j in range(i + 1, len(corners)):
            r1, c1 = corners[i]
            r2, c2 = corners[j]

            if r1 < r2 and c1 < c2:
                if (rows[r1][c2] == '+' and rows[r2][c1] == '+' and
                        all(rows[r1][col] in '+-' for col in range(c1, c2 + 1)) and
                        all(rows[r2][col] in '+-' for col in range(c1, c2 + 1)) and
                        all(rows[row][c1] in '+|' for row in range(r1, r2 + 1)) and
                        all(rows[row][c2] in '+|' for row in range(r1, r2 + 1))):
                    rectangles_count += 1

    return rectangles_count
