=begin

Given a string, return true if the number of parenthesis are evenly matched.
- the opening for every closing parenthesis, there needs to be an opening parethensis before it
  - )( is not considered valid

Examples:

  'Hey!' -> true

  ')Hey!(' -> false

  '((What) (is this))?' -> true
    -> (()())

  'What ())(is() up' -> false

Data Structures:
- array of paired characters
- hash with paired characters and their counts

Algorithm:
- Find the pairs to match
  - create an array of pair keys
  - for each character in the input string
    - check if it matches a pair
      - if yes, increment count by 1 if it is opening
      - otherwise, decrement count by 1
      - add pair and count to pair_counts hash
    - if there is no match, skip to next iteration
    - if any value in pair_counts is negative
      - return false
- Check if all pairs are cancelled out
  - return true if all values in pair_counts are zero
  - otherwise return false

=end

def count_pairs!(char, pair_counts, pair)
  case char
  when pair[0] then pair_counts[pair] += 1
  when pair[1] then pair_counts[pair] -= 1
  end
end

def balanced?(string)
  pairs = %w[() [] {} “” ‘’]
  pair_counts = Hash.new(0)

  string.each_char do |char|
    pair = pairs.find { |p| p.include?(char) }
    count_pairs!(char, pair_counts, pair) if pair
    return false if pair_counts.values.any?(&:negative?)
  end

  pair_counts.values.all?(&:zero?)
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
p balanced?(' “ {‘’}[] ” ( )') == true
p balanced?('{}][') == false
