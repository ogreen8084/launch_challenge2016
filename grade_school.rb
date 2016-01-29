# grade_school launchschool challenge
class School
  def initialize
    @grade_hash = Hash.new()
  end

  def add(student, grade)
    @grade_hash[grade] ? @grade_hash[grade] << student : @grade_hash[grade] = [student]
  end

  def grade(grade)
    @grade_hash[grade] ? @grade_hash[grade] : []
  end

  def sort_hash_values
    @grade_hash.values.each(&:sort!)
  end

  def sort_hash
    sort_hash_values
    Hash[@grade_hash.sort]    
  end

  def to_h
    sort_hash
  end
end
