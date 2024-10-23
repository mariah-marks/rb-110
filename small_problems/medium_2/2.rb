=begin

Given a string, return a boolean
- String values re case-insensitive
- true is returned if the values in the string
  - are unique/only occur once
  - don't occur if the letter they are paired to occurs

Letter pairings:
  B:O   X:K   D:Q   C:P   N:A
  G:T   R:E   F:S   J:W   H:U
  V:I   L:Y   Z:M

Examples:
  ('BATCH') == true
    - B: 1, O: 0
    - A: 1, N: 0
    - T: 1, G: 0
    - C: 1, P: 0
    - H: 1, U: 0

  ('BUTCH') == false
    - U & H used together
  ('Baby') == false
    - B used twice

  Data Structures:
  - intermediate:
    - hash of paired letters

  Algorithm:
  - create collection of paired characters / 'blocks'
    - array of strings
  - Convert input string to lowercase
  - Iterate over the paired characters
    - compare each pair to the input string
      - if both values occur, or either value occurs more than once, return false
      - return true if values in pair occur 0 or 1 times total
=end

BLOCKS = %w[bo xk dq cp na gt re fs jw hu vi ly zm].freeze

def block_word?(word)
  BLOCKS.none? { |block| word.downcase.count(block) > 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('apples') == false
p block_word?('Baby') == false
