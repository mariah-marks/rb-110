require 'date'

=begin

Given a year, return the number of Fridays which fall on the 13th.

Rules:
  - only handle years after 1752

Examples:
  2015 -> 3
  1986 -> 1

Algorithm:
  - Given a year, count the number of times the 13th falls on a friday
    - Initialize a variable to count fridays
      - friday_count
    - Set the day to 13
    - For every month 1..12
      - create a new date on the 13th of each month.
      - if the day is a friday
        - increment friday_count by 1
- return friday_count

=end

def friday_13th(year)
  friday_count = 0
  day = 13

  1.upto(12) do |month|
    date = Date.new(year, month, day)
    friday_count += 1 if date.friday?
  end

  friday_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
