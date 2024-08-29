=begin
- Given an integer representing a year, return the century with the appropriate suffix.
* New centuries begin in years that end with 01

If the century
  - ends with 2, append 'nd'
  - ends with 3, append 'rd'
  - ends with 1, append 'st', unless the previous digit is 1
  - otherwise, append 'th'

Centuries:
- 11201 - 11300 -> 113th
- 2001 - 3000 -> 21st
- 1901 - 2000 -> 20th
- 1801 - 1900 -> 19th
- 201 - 300 -> 3rd
- 101 - 200 -> 2nd
- 01 - 100 -> 1st

Examples/Test Cases:
  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(1900) == '19th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'

Data structure:
- starting: integer
- intermediate: integer converted to a string
- ending: string

Algorithm:
- Determine the century:
  - set century to result of dividing input integer by 100
  - if there is a remainder, return century rounded to the nearest one's place.
  - if there is no remainder, return century
- Determine the suffix:
  - if century ends in 1, but not 11, append 'st'
  - if century ends in 2, append 'nd'
  - if century ends in 3, append 'rd'
  - otherwise, append 'th'
- Return the century as a string

=end

def year_to_century(year)
  century_float = (year.to_f / 100)
  century_float % 100 != 0 ? century_float.ceil : century_float.to_i
end

def century(year)
  century_float = (year.to_f / 100)
  century = year_to_century(year).to_s
  
  suffix = case
           when century[-2] == '1' then 'th'
           when century[-1] == '1' then 'st'
           when century[-1] == '2' then 'nd'
           when century[-1] == '3' then 'rd'
           else 'th'
           end

  century + suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(1900) == '19th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'