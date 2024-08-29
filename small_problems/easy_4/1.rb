=begin
- Given two strings, return a new string with the shorter string prepended and appended to the
  longer string.
* strings are always different lengths
* if one string is empty, the other string is returned

Examples/Test cases:
  'abc', 'defgh' == "abcdefghabc"
  'abcde', 'fgh' == "fghabcdefgh"
  '', 'xyz' == "xyz"

Data structure:
- beginning: two strings
- ending: a new string

Algorithm:
- Given two strings, `string_1` and `string_2`:
  - create two variables `short_string` and `long_string`
    - if `string_1` > `string_2`, set `string_1` to `long_string` and `string_2` to `short_string`
    - otherwise, set `string_2` to `long_string` and `string_1` to `short_string`
- return a new string with `short_string` prepended and appended to `long_string`

=end

def short_long_short(string1, string2)
  if string1.length > string2.length
    long, short = string1, string2
  else
    short, long = string1, string2
  end

  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
