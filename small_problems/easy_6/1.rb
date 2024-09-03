
require 'pry-byebug'
=begin

Problem:
- Given a coordinate degree, return a string converted to DMS.
* There are 60 minutes in a degree and 60 seconds in a minute.

Rules:
- The method should return a string in the format "dd°mm'ss\"" with final values
rounded to the nearest whole number.

Examples:
  30 == 360°00'00"

  76.73 == 76°43'48"
  0.73 * 60 = 43.8 -> 43 minutes
  0.8 * 60 = 48.0 -> 48 seconds
  "#{degrees}#{DEGREE}#{mins}'#{secs}\""

  360 == 360°00'00" || 360 == 0°00'00"

Data Structures:
- beginning: integer
- integermediate: integers concatenated into string
- ending: string

Algorithm:
- SET minutes_per_degree = 60
- SET seconds_per_minute = 60
- SET whole number as degrees
  - SET degrees to input rounded to the nearest whole number.
- CONVERT decimal to minutes and seconds
  - SET minutes to remainder from input / degrees
  - convert to minutes
    - multiply by seconds_per_degree
  - SET seconds to remainder from minutes / seconds
  - convert to seconds
    - multiply by seconds_per_degree
  - Format values to nearest hundreth place
- RETURN string with values concatenated
=end

DEGREE = "\u00B0"
SECONDS_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(input)
  degrees = input.floor
  
  if degrees == input
    minutes, seconds = 0, 0
  else
    minutes = ((input % degrees) * SECONDS_PER_DEGREE)
    seconds = (minutes % minutes.floor) * SECONDS_PER_MINUTE
  end

  format(%(#{degrees}#{DEGREE}%.2d'%.2d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
