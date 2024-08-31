=begin

Problem:
Given an array of integers 0-19, return a new array with integers sorted alphabetically based on their
english spelling.

Rules:
- array arguments are sorted numerically, [0..19]

Example:
["zero"..."nineteen"]
[0 1 2 3 ... 19] -> 
  0=>"zero"
  1=>"one"
  2=>"two"
  ..19=>"nineteen"

{8=>"eight", 18=>"eighteen", 11=>"eleven" ... 0=>"zero"}
[8 18 11 ... 0]

Data Structures:
- beginning: array of integers
- intermediate: 
    - array of names
    - hash with integer keys and string values
- ending: new array of integers (values)

Algorithm:
- TRANSFORM integers to english name
  - create an array of names ["zero" ... "nineteen"]
- SORT numbers by alphabetical order
  - Iterate over integers array
    - retrieve the string at each number index in  `names`
    - sort alphabetically by return value
- RETURN sorted integers

=end

def alphabetic_number_sort(integers_array)
  names = %w(zero one two three four five six seven eight nine ten eleven
             twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
             )
  integers_array.sort_by do |number|
    names[number]
  end
end


p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Further exploration:

# def alphabetic_number_sort(integers_array)
#   names = %w(zero one two three four five six seven eight nine ten eleven
#              twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
#              )

#   sorted_names = integers_array.map { |name| names[name] }.sort
#   sorted_names.map { |name| names.index(name) }

# end
