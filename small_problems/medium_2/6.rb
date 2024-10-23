=begin

Given three angles, return a symbol representing the triangle type.

Rules:
  - acute triangle: all angles are less than 90
  - right: one angle equals 90
  - obtuse: one angle is greater than 90
  * all angles must be greater than 0, and sum to 180
  * angles are always integers

Examples:
- 60, 70, 50
  all greater than 0 & sum to 180 ?
    - if false return invalid
  - include 90 ?
    - right
  all less than 90?
    - acute
  else
    - obtuse

Algorithm:
- create a new array with each angle as an element
  - validate all are greater than 0 and sum to 180
    - find the sum
      - if sum is less than 180 return :invalid
    - check if any element equals 0
      - if true return :invalid
- check if array contains any values equal to 90
    - return :right
- check if any array values are greater than 90:
    - return :obtuse
- else return :acute

=end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  if angles.reduce(:+) != 180 || angles.include?(0)
    :invalid
  elsif angles.any? { |angle| angle >= 90 }
    angles.include?(90) ? :right : :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
