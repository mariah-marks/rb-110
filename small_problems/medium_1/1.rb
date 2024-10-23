=begin

Given an array, return a new array with the first element moved to the end of the array.

Examples:
  [7, 3, 5, 2, 9, 1] == [3, 5, 2, 9, 1, 7]

Data Structures:
- beginning: array of integers
- intermediate: a new array with elements copied
- ending: a new array with the first integer moved to the end of the array

Algorithm:
- CREATE a copy of the input array
- TRANSFORM the array so the first element is moved to the end of the array
  - iterate over the input array
    - #map
    - return a copy of each array element
  - remove the first element
  - append the first element to the end of the array
- RETURN the array

=end

def rotate_array(input)
  copy_of_input = input.map(&:dup)
  copy_of_input.push(copy_of_input.shift)
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

# Further exploration

def rotate(input)
  if input.instance_of?(Integer)
    rotate_array(input.digits.reverse).join.to_i
  else
    input[1..] << input[0]
  end
end

p rotate(1234) == 2341
p rotate('1234') == '2341'
