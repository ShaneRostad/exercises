# write a small archiving program that stores students' names along with the grade that they are in




# class Student
# - name
# - grade


# in the end you should be able to:
# - add a students name to the roster for a grade
# - - "Add Jim to grade 2."
# - - "OK."

# Get a list of all students enrolled in a grade
# - Which students are in grade 2?
# - "We;ve only got Jim just now."

# Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3 etc. And students within a grade should be sorted alphabetically by name:
# - Who all is enrolled in School right now?
# - "Grade 1: Anna, Barb, and Charlie. Grade2: Alex, Peter, and Zoe. Grade 3.."

# note all our students only have one name.

class School
  def initialize
    @school = Hash.new { |hash, key| hash[key] = []}
  end

  def to_h
    @school.sort.each {|grade| grade[1].sort! if grade[1].size > 1 }.to_h
  end

  def add(name, grade)
    @school[grade] << name
  end

  def grade(grade)
    @school[grade]
  end
end

school = School.new
[
  ['Jennifer', 4], ['Kareem', 6],
  ['Christopher', 4], ['Kyle', 3]
].each do |name, grade|
  school.add(name, grade)
end

p school.to_h
