# cute_angles.rb

# model solution restricting answers to 0 - 360 degrees
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  degrees_f = degrees % 360
  format(%(#{degrees_f}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")

# model solution
=begin DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
=end

# my solution
=begin
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(num)
  degrees = num.to_i
  degrees_string = degrees.to_s

  minutes_left = (num - degrees) * MINUTES_PER_DEGREE
  minutes = minutes_left.to_i
  minutes_string = minutes.to_s
  minutes_string = "0#{minutes}" if minutes_string.length == 1

  seconds_left = (minutes_left - minutes) * SECONDS_PER_MINUTE
  seconds = seconds_left.to_i
  seconds_string = seconds.to_s
  seconds_string = "0#{seconds}" if seconds_string.length == 1

  answer = format(%(#{degrees_string}#{DEGREE}%02d'%02d"), minutes_string, seconds_string)
  puts answer
  answer
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

=end