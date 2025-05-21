# Create a method that takes a string argument that consists entirely of numeric
#  digits and computes the greatest product of four consecutive digits in the string.
# The argument will always have more than 4 digits.

=begin

Given an integer string, return the greatest product of 4 consecutive digits
* the argument always has more than 4 digits

Examples:
  '23456' 
    3 4 5 6 -> 360
  
  '3145926' 
  [3 1 4 5] -> 60
  [1 4 5 9] -> 180
  [4 5 9 2] -> 360
  [5 9 2 6] -> 540

Data structures:
  - intermediate:
    - 4 element array of consective integers


Algorithm:
- Initialize a variable `largest_product` = 0
- Iterate over a range (0.. up to integer_str.length - 4), using the index
  - for each index, 
    - create a substring of digits
    - calculate `product` of digits
      - convert to an integer
      - convert integer to an array of `digits`
      - return the product of `digits`
    - if product of digits > largest_product
      - reassign largest_product to `product`
- return largest_product

=end

def calculate_product(digits)
  digits = digits.to_i.digits.reverse
  digits.reduce(:*)
end

def greatest_product(integer_str)
  largest_product = 0

  (0..integer_str.length - 4).each_with_index do |num, index| # 2, 0
    digits = integer_str[index, 4]
    product = calculate_product(digits)
    largest_product = product if product > largest_product
  end

  largest_product
end

# 29 minutes

# 2nd attempt
=begin
  problem:
    given a string of digits, return the largest product that can be formed where
    the digits are consecutive.

  examples:
    '23456'
    [2 3 4 5], [3 4 5 6]
    => 120.  ,  => 360
  
  data structures:
  - array of digit arrays (4 digits long)
    -> convert to an array of products

  approach:
    iterate over the string. for each character 0 up to the 4th from last character,
    create a new array of characters, from current index, 4 elements long. convert
    the characters in the array to integers. find the product of integers and
    return it as an element in the final array. return the largest integer product.

  algorithm:
    - find all 4 digit permuations
      - init result to empty array
      - for each index 0 to str.size - 4, for each starting_idx
        - create subarray from starting_idx, 4 chars long
        - convert each string into an integer
        - add subarray to `result`
    - transform result so that each subarray is replaced by the product of it's values
    - return the largest element in `result`
      
=end

def greatest_product(str)
  result = []

  (0..str.size-4).each do |starting_idx|
    subarr = str[starting_idx, 4].chars
    subarr.map!(&:to_i)
    result << subarr
  end

  result.map! do |subarr|
    subarr.reduce(:*)
  end

  result.max
end

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6