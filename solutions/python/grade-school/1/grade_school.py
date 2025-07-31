class School:
    def __init__(self):
        self.students_grades = {}
        self.students = []
        self.addition_result = []

    def add_student(self, name: str, grade: int):
        if name in self.students:
            self.addition_result.append(False)
            return None

        if grade in self.students_grades:
            self.students_grades[grade].append(name)
        else:
            self.students_grades[grade] = [name]

        self.addition_result.append(True)
        self.students.append(name)

        return None

    def roster(self) -> list[str]:
        result = []
        sorted_students_grades = dict(sorted(self.students_grades.items()))

        for students in sorted_students_grades.values():
            result += sorted(students)

        return result

    def grade(self, grade_number: int) -> list[str]:
        return sorted(self.students_grades.get(grade_number, []))

    def added(self) -> list[bool]:
        return self.addition_result
