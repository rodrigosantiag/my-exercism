class School
  def initialize
    @grades_and_students = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(student, grade)
    return false if roster.include?(student)

    @grades_and_students[grade] << student
    true
  end

  def roster
    sorted_grades_and_students.values.flatten
  end

  def grade(grade)
    sorted_grades_and_students.fetch(grade, [])
  end

  private

  def sorted_grades_and_students
    @grades_and_students.sort.to_h.transform_values(&:sort)
  end
end
