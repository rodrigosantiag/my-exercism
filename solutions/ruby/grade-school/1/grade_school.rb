class School
  def initialize
    @grades_and_students = Hash.new
  end

  def add(student, grade)
    return false unless can_add?(student)

    if @grades_and_students.include? grade
      @grades_and_students[grade] << student
    else
      @grades_and_students[grade] = [student]
    end

    true
  end

  def roster
    result = []
    ordered_by_grades = @grades_and_students.sort.to_h

    ordered_by_grades.each_value { |students| result << students.sort}
    result.flatten!
  end

  def grade(grade)
    (@grades_and_students[grade] || []).sort!
  end

  private

  def can_add?(student)
    @grades_and_students.each do |_, students|
      return false if students.include? student
    end

    true
  end
end
