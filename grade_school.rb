# grade_school launchschool challenge
class School
  def initialize
    @grade_hash = {}
  end

  def add(student, grade)
    @grade_hash[grade] ? @grade_hash[grade] << student : @grade_hash[grade] = [student]
  end

  def grade(grade)
    @grade_hash[grade] ? @grade_hash[grade] : []
  end

  def to_h
    @grade_hash.values.each(&:sort!)
    Hash[@grade_hash.sort]
  end
end
