require 'date'

=begin
Given a time in 24 hour format, return an integer representing the number of minutes from
midnight. One method should handle times before midnight, and one should handle times after
midnight.
* 24:00 and 00:00 are both considered equivalent to midnight
* min/day = 1440

Examples:
after midnight:
  12:34 -> 754
  12h * 60 m/h -> 720 + 34 = 754m

before midnight:
  12:34 -> 689m
  1440 m/d - (12 * 60) - 34 = 686m

Data structures:
- beginning: string
- intermediate:
  - array with hours and minutes
- ending: integer

Algorithm:
1. SET hours and minutes
  - Initialize hours to first two values
  - Initialize minutes to last two values
2. CONVERT time to minutes
  - multiply hours by 60
  - sum hours and minutes
  - return sum
For `hours_after_midnight`
  - return the sum
For `hours_before_midnight`
  - return the difference of sum from minutes in the day.

=end

MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def normalize_minutes(time)
  minutes = time[0] * 60 + time[1]
  minutes == MINUTES_PER_DAY ? 0 : minutes
end

def after_midnight(time)
  time = time.split(":").map { |number| number.to_i}
  normalize_minutes(time)
end

def before_midnight(time)
  time = time.split(":").map { |number| number.to_i}
  minutes = normalize_minutes(time)
  minutes != 0 ? MINUTES_PER_DAY - minutes : minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
