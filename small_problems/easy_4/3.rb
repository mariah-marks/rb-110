=begin
Given an integer representing a year, output true if the year is a leap year,
false if it is not.

Rules:
Leap years greater than 0 and either:
- evenly divisible by 100 and 400
- evenly divisible by 4, but not 100

Examples:
  2016 % 100 = 16
  2016 % 4 = 0 -> true

  240001 % 100 = 1
  240001 % 4 = 1 -> false

  2400 % 100 = 0
  2400 % 400 = 0 -> true

  1752 % 100 = 52
  1752 % 4 = 0 -> true

Data structures:
- beginning: integer
- ending: boolean

Algorithm:
1. check if the integer is evenly divisible by 100
  - if so, return true if evenly divisble by 400, false if not.
  - otherwise, return true if the integer is evenly divisble by 4.
=end

def leap_year?(year)
  year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
end

=begin

Futher Exploration:
  This method will fail for any years that are evenly divisible by 400, because 400 is an even
  multiple of 100, the conditional is exited before the elsif expression is evaluates.

- Example re-written:
    def leap_year?(year)
      if year % 4 == 0 && year % 100 != 0
        true
      else
        year % 400 == 0
      end
    end

- Refactored:
  def leap_year?(year)
    (year % 4 == 0 && year % 100 != 0) ? true : year % 400 == 0
  end

=end

p leap_year?(2016) == true 
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
