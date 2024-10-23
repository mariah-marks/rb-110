=begin

Given three lengths, return a symbol representing the triangle based on the given measurements.

Rules:
- hypotenuse less than than sum of two shorter sides
- all sides greater than 0

equilateral
- s1 = s2 = s3

isosceles
- s1 != s2 or s1 != s3

scalene
- s1 != s2 != s3

invalid
- s1 or s2 or s3 = 0
- s1 + s2 > s3

Examples:
  3, 3, 3 -> :equilateral
  s1 = 3, s2 = 3, s3 = 3

  3, 3, 1.5 -> :isosceles
  s1 = 1.5, s2 = 3, s3 = 3

Algorithm:
- Assign sides to variable names
  - the two shorter sides are assigned to s1 and s2
  - the longest side is assigned to s3
- Classify triangle
  - Check if triangle is invalid
    - if any side = 0
    - or sum of s1 and s2 > s3
  - Check if scalene
    - if s1 != s2 and s2 != s3
  - Check if equilateral
    - if s1 = s2 = s3
  - Else scalene
- Return classification

=end

def triangle(*sides)
  lengths = *sides.to_a.sort
  s1, s2, s3 = *lengths

  case
  when lengths.include?(0) || (s1 + s2) < s3 then :invalid
  when s1 == s3 && s2 == s3 then :equilateral
  when s1 != s2 && s2 != s3 then :scalene
  else
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles # [1.5, 3, 3]
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
