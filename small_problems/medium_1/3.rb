=begin

Given an integer, return the maximum rotation.
* if 0 is ever the first in sequence, it isn't included in the return value
* the number of rotations is input digit count - 1

Example:
1.
  735291 -> [3 5 2 9 1 7]  first digit becomes last
  352917 -> [3 2 9 1 7 5]  second digit becomes last
  329175 -> [3 2 1 7 5 9]  third digit becomes last
  321759 -> [3 2 1 5 9 7]  fourth digit becomes last
  321597 -> [3 2 1 5 7 9]  fifth digit becomes last

2. 105 -> [0 5 1]
   051 -> [0 1 5]
   [0 1 5] -> "015" -> 15
   ## Zero is dropped because it is not a leading valid number

Data structures:
- input: integer
- intermediate:
  - array of digits from input
  - result array
- output: an integer with values rotated

Algorithm:
- Create an array of digits from the input
  - digits
- Create an empty array
  - rotated_digits
- for each value (index) in 0..collection length - 1
  - remove the value at index and append to the end of the array
  - append the value at index to new array
  - increment index
  - repeat until new_array size equals intermediate array size
- Convert the array to a string
- Convert the string to an integer
- Return the integer

=end

def max_rotation(integer)
  digits = integer.digits.reverse
  rotated_digits = []

  0.upto(digits.size - 1) do |index|
    digits << digits.delete_at(index)
    rotated_digits << digits[index]
  end

  rotated_digits.join.to_i
end

p max_rotation(735_291) == 321_579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845
