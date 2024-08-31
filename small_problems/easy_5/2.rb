=begin

Problem:
Given an integer representing the minutes before or after midnight, return a string that represents the time in
24-hour format
* Negative values represent minutes before midnight.
* Positive values represent minutes after midnight.
* Any integer should work as an input.
* There are 1,440 minutes in 24 hours.

Examples:
  0 -> "00:00"
  0.divmod(60) -> [0, 0] -> "00:00"

  35 -> "00:35"
  35.divmod(60) -> [0, 35] -> "00:35"

  800 -> "13:20"
  800.divmod(60) -> [13, 20] -> "13:20"

  -3 -> "23:57"
  3.divmod(60) -> [0, 3] -> "00:03"

  -1437 -> "00:03" 
  1437.divmod(60) -> [23, 57]

  3000 -> "02:00"
  3000 % 1440 -> 120
  120.divmod(60)

  -4231 -> "01:29"
  4231 % 1440 -> 1351
  1351.divmod(60) -> [22, 31]
  --> if negative: 60.divmod(31) -> [1, 29]


Data structures:
- beginning: integer
- intermediate: an array of integers
    - #divmod and %
  - #divmod returns the result of integer division and the remainder in an array
- ending: string representing military time

Algorithm:

1. CONVERT minutes to hours and minutes
  - IF example is less than 1439 minutes (less than 1 day), and greater than 0
    - return minutes
  - ELSIF greater than 1439 or less than -1439
    - return the remainder of integer division from 1440
  - ELSE less than 0
    - subtract the the absolute value of minutes from 1440
  - Divide minutes by 60
    - SET result of integer division to hours and remainder to minutes
    - Return values as elements in an array
      - time
2. TRANSFORM integer to string
  - Iterate over array
    - format each number to two decimal places
  - Return a new string with elements joined by ':'
3. RETURN string

=end

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def format_time(time)
  time.map! { |number| format('%.2d', number) }
  time.join(":")
end

def time_of_day(minutes)
  if minutes.between?(0, MINUTES_PER_DAY)
    minutes
  elsif minutes.abs > 1439
    minutes = minutes % MINUTES_PER_DAY
  else
    minutes = 1440 - minutes.abs
  end

  time = minutes.divmod(MINUTES_PER_HOUR)
  format_time(time)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
