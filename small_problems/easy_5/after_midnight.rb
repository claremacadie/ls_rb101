# after_midnight.rb

# solution with Date/Time classes
SECONDS_PER_MINUTE = 60
MINUTES_PER_DAY = 1440

def after_midnight(str)
  require 'time'
  seconds = Time.parse(str) - Time.parse('00:00')
  minutes = (seconds / SECONDS_PER_MINUTE).to_i
  minutes_after_midnight = minutes % MINUTES_PER_DAY
end

def before_midnight(str)
  minutes = MINUTES_PER_DAY - after_midnight(str)
  minutes_before_midnight = minutes % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# my solution
=begin
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def after_midnight(string)
  hh = string[0,2].to_i
  mm = string[3,4].to_i
  minutes_after_midnight = (mm + (hh * MINUTES_PER_HOUR)) % MINUTES_PER_DAY
end

def before_midnight(string)
  minutes_before_midnight = (MINUTES_PER_DAY - after_midnight(string)) % MINUTES_PER_DAY
end

=end