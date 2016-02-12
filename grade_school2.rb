
# grade_school launchschool challenge
class School
  def initialize
    @grade_hash = Hash.new([])
  end

  def add(student, grade)
    @grade_hash[grade] += [student]
  end

  def grade(grade)
    @grade_hash[grade]
  end

  def to_h
    @grade_hash.sort.each_with_object({}) do |(grade, student), result|
      result[grade] = student.sort
    end
  end
end
