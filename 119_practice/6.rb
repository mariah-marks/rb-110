# Create a method that takes a string argument and returns a hash in which the keys represent the
# lowercase letters in the string, and the values represent how often the corresponding letter occurs
# in the string.

=begin

input: a string
output: a hash, with character keys and character count values
* only count lowercase letters
* if the string doesn't contain lowercase letters, return an empty hash

Examples:
  'W. E. B. Du Bois' # => {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}

Algorithm:
- Create an array of lowercase characters
  - initialize variable `lowercase_chars`
  - convert to a new array of characters
  - select lowercase characters
- Create a new hash, with each character and it's count as a pair
  - iterate over `lowercase_chars`, for `char`
  - add a new hash pair to `results` for each value, with key set to `char` and value set to char
    count
  - return the `results` hash
=end

def count_letters(string)
  lowercase_chars = string.chars.select do |char|
    ('a'..'z').include?(char)
  end

  lowercase_chars.each_with_object({}) do |char, results|
    results[char] = lowercase_chars.count(char)
  end
end

# 25 mins

# 2nd attempt
=begin

Given a string, return a hash
- the keys are string characters, with frequency values
- only include pairs for lowercase alphabetical characters
 * if none are included, or an empty string is passed, return an empty hash

Examples:
  'woebegone'
    {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}

  'W. E. B. Du Bois'
    {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}

  'x'
  {'x' => 1}

  ''
  {}

  '!!!'
    {}

Algorithm:
  - check each `char` in `str`, 
    - if char is lowercase and alphabetical
      - compare to a range 'a'..'z'
      - add pair to result hash
        - set key to `char`
        - set value to number of times char occurs in str
  - return result hash

=end

def count_letters(str)
  result = {}
  str.each_char do |char|
    if ('a'..'z').include?(char)
      result[char] = str.count(char)
    end
  end
  result
end

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}

# 8.5 minutes