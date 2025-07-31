class Garden:
    DEFAULT_STUDENTS = ["Alice", "Bob", "Charlie", "David",
                        "Eve", "Fred", "Ginny", "Harriet",
                        "Ileana", "Joseph", "Kincaid", "Larry"]

    PLANTS_DICTIONARY = {
        "G": "Grass",
        "C": "Clover",
        "R": "Radishes",
        "V": "Violets",
    }

    def __init__(self, diagram, students=None):
        self.diagram = diagram.split("\n")
        self.students = sorted(students) if students is not None else self.DEFAULT_STUDENTS

    def plants(self, student):
        result = []
        start_idx = self.students.index(student) * 2

        for row in self.diagram:
            for plant in row[start_idx:start_idx+2]:
                result.append(self.PLANTS_DICTIONARY[plant])

        return result
