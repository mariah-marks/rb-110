# Create a method that takes a nonempty string as an argument and returns an array consisting of a
# string and an integer. If we call the string argument s, the string component of the returned array
# t, and the integer component of the returned array k, then s, t, and k must be related to each other
# such that s == t * k. The values of t and k should be the shortest possible substring and the largest
# possible repeat count that satisfies this equation.

# You may assume that the string argument consists entirely of lowercase alphabetic letters.

=begin

Given a substring, return an array
- the first array element is the smallest substring that can be repeated to create the input string
- the second array element is maximum number of times the substring can be repeated to equal input 
  string
* input string always contains repeating lowercase letters

Examples:
  'xyzxyzxyz' ... ['xyz', 3]
  if substring is 'x', does 'x' * 9 = 'xyzxyzxyz'
    even substring skipped
    if substring is 'xyz',  does 'xyz' * 3 == 'xyzxyzxyz' ( substring size)
  
  'aaaaaaaa' ... ['a', 8]

  'xyxy' -> ['xy', 2]
  str[0..0] .. does 'x' * 4 = 'xyxy' ?
    odd substring skipped
    'xyxy' 
  

Algorithm
- given a string `str`
- intialize multiplier = str.size
- Find the smallest possible substring
  - initialize a variable called `substring`
    - from 0..string.size, iterate over the characters in `str`, using the index
      - set substring = str[0..index] * multiplier
      - if substring == str,
        return multiplier
      - else,
        re-assign multiplier to next odd or even number
        go to next iteration
      - if str size is odd
          multiplier = str.size / next descending odd number
      - else str size even
        multiplier = str.size / next descending even number
- Find the maximum number of times substring can be repeated to equal input `str`
  - return mulitplier
=end

def repeated_substring(str)
  multiplier = str.size
  
  substring = ''
  (0..str.size).each do |index|
    substring = str[0..index]
    next if index.odd? && str.size.odd?
    if (substring * multiplier) == str
      return [substring, multiplier]
    else
      multiplier = (multiplier.odd? ? (multiplier / 3) : multiplier / 2)
      return [str, multiplier] if multiplier == 1
    end
  end

  [substring, multiplier]
end

# 46 minutes


# 2nd attempt
=begin

problem:
  given a string, return an 2 element array
  the first element (k) of the array is the shortest repeating substring in `str`
  the second element (t) is largest factor that k can be repeated to equal str

examples:
  ('xyzxyzxyz') == ['xyz', 3]
  str_size = 9 
  factors = [9, 3, 1]

  iterate over factors
    => 9
  substr_length = str_size / factor, 9 / 9
    => 1
  substr = str[0, substr_length]
    'x'

  substr * factor = str ?
  'x' * 9 == str ?


data structures:
  - array of factors

approach:
  - find all possible factors from 1 to str size, store in an array. iterate over factors, and for
    each factor, find the corresponding substring where the size can be multiplied by factor to match
    str size. check if substring and str are equal, if so, return an array with substr and factor as
    elements. else go to next iteration.

algorithm:
  - create an array of factors, largest to smallest
    - init factors to empty array
    - iterate over a range from 1 to n, for each divisor
      - could use `down_to`
      check if n modulo divisor equals 0
      add to factors if true
  - check each factor and it's corresponding substring
    iterate over factors, for each factor
    - set substr_length = str size / factor
    - set substr = string slice idx 0, substr_length chars long
    - check if substr multiplied by factor = str
      - if true, return array with [substr, factor]
=end


def repeated_substring(str)
  str_size = str.size
  factors = []

  str_size.downto(1) do |divisor|
    factors << divisor if str_size % divisor == 0
  end

  factors.each do |factor|
    substr_length = str_size / factor
    substr = str[0, substr_length]
    return [substr, factor] if substr * factor == str
  end
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]

# 15 minutes