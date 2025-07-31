def transpose(lines):
    if not lines:
        return lines

    lines = lines.split("\n")
    longest_line = max(lines, key=len)
    result = ["" for _ in range(len(longest_line))]

    for i in range(len(lines)):
        for j in range(len(lines[i])):
            result[j] += lines[i][j] if len(result[j]) == i else lines[i][j].rjust(i - len(result[j]) + 1)

    return "\n".join(result)
