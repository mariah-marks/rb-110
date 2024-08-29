=begin

Problem:
  Manually convert a string to an integer. If there is a sign, return a number matching the sign.

Examples:
  '4321' -> 4321
  '-570' -> -570
  '+100' -> 100

Data Structures:
- beginning: string
- intermediate: hash
- ending: integer

Algorithm:
- Check if string starts with '-'
  - if yes, pass a copy of string without the first value to `string_to_integer`
  - multiply return value by -1
- Check if string starts with '+'
  - if yes, re-assign string to copy of string without first value
  - pass string to `string_to_integer`
=end

def string_to_integer(string)
  digits = ('0'..'9').zip(0..9).to_h

  integers = string.chars.map { |number| digits.fetch(number) }.reverse

  integers.map.with_index do |number, index|
    number * (10**index)
  end.sum
end

def string_to_signed_integer(string)
  if string.start_with?("-")
    -1 * string_to_integer(string[1..-1])
  else
    string = string[1..-1] if string.start_with?("+")
    string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
