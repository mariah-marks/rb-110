=begin

Given a string, return a hash.
input: string alphabetical(upper and lowercase) and non-alphabetical characters.
output: a hash, each with categories as keys, and the percentages as values.

Examples:
  ('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }

  ('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
  ('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

Algorithm:
1. Sort input values into categories
  - Create a new empty hash
    - `result`
  - Create a new hash with three keys
    - `character_categories`
    - :lowercase, :uppercase, :neither
    - pair each to regex search criteria
  - Iterate over character_categories
    - for each hash pair:
      - count the number of matches from the input, using the key as the
        search criteria
      - add the category and match count as a pair to `result`

2. Calculate each percentage for each category
  - find the total number of characters
    - total_characters
  - Return a new hash with values converted to percentages
    For each pair in `result`
    - divide count from total_characters
    - mutliply by 100
    - round to the nearest tenths place

=end

def letter_percentages(input)
  result = Hash.new(0)
  character_categories = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^A-Za-z' }
  total_characters = input.size.to_f

  character_categories.each { |category, regex| result[category] = input.count(regex) }

  result.transform_values { |count| (count / total_characters * 100).round(1) }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == { lowercase: 66.7, uppercase: 33.3, neither: 0.0 }
