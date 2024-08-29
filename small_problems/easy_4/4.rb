=begin
- Update the leap year method to accomodate Julian calendar dates
* the Julian calendar references years up to 1752.

Examples:
  2400 % 100 = 0
  2400 % 400 = 0 -> true

  1752 % 100 = 52
  1752 % 4 = 0 -> true
  
  100 % 4 = 0 -> true

  1700 % 4 = 0 -> true

Data structure:
- beginning: integer
- ending: boolean

Algorithm:
- IF year < 1752
  - return true if year is evenly divisible by 4
- ELSE
  - return true if year is either:
    - evenly divisible by 4, but not 100
    - evenly divisible by 400
=end

def leap_year?(year)
  return true if year < 1752 && (year % 4 == 0)
  (year % 4 == 0 && year % 100 != 0) ? true : year % 400 == 0
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true