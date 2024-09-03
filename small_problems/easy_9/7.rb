=begin

Problem:
- given an three grades, return the average as a letter grade
* grades are integers between 0 and 100

A: 90-100
B: 80-90
C: 70-80
D: 60-70
F: 0-60

Examples:
  (95, 90, 93) == "A"
  (50, 50, 95) == "D"

Data Structures:
- beginning: integer
- intermediate: hash with pair for each grade
- ending: letter grade

Algorithm:
- calculate the average of the grades
- create a hash with the letter grade as the key, and the range
  of integers as the value.
- iterage over the grades hash
  - return the key of the range containing the value.
=end

def get_grade(grade_1, grade_2, grade_3)
  gpa = (grade_1 + grade_2 + grade_3) / 3
  grades = { "A" => (90..100), "B" => (80..90), "C" => (70..80), "D" => (60..70), "F" => (0..60) }
  letter_grade = ""

  grades.any? do |letter, grade|
    letter_grade = letter if grade.include?(gpa)
  end

  letter_grade
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
