class Matrix:
    def __init__(self, matrix_string):
        rows = matrix_string.split("\n")
        self.matrix = []

        for row in rows:
            line = [int(r) for r in row.split()]
            self.matrix.append(line)

    def row(self, index):
        return self.matrix[index-1]

    def column(self, index):
        return [row[index - 1] for row in self.matrix]
