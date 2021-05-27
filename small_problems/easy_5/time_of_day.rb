# time_of_day.rb

# solution with Date and Time classes with consideration for day of the week
def time_and_day(int)
  require 'time'
  time_zero = Time.new(2021,1,3)
  time_new = time_zero + (int * 60)
  time_new.strftime "%A %H:%M"
end

p time_and_day(0) == "Sunday 00:00"
p time_and_day(-3) == "Saturday 23:57"
p time_and_day(35) == "Sunday 00:35"
p time_and_day(-1437) == "Saturday 00:03"
p time_and_day(3000) ==  "Tuesday 02:00"
p time_and_day(800) == "Sunday 13:20"
p time_and_day(-4231) == "Thursday 01:29"

# solution with Date and Time classes
=begin def time_of_day(int)
 time_zero = Time.new(2000,1,1)
 time_new = time_zero + (int * 60)
 time_new.strftime "%H:%M"
end
=end

# model_solution
=begin MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  #delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY

  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end
=end

# my solution
=begin def time_of_day(int)
  case int <=> 0
  when 0
      hh = 0
      mm = 0

  when -1
    minutes_left = -int % 1440
    hours = minutes_left / 60
    minutes = minutes_left % 60
    hh = 24 - (hours + 1)
    mm = (minutes == 0 ? 0 : 60 - minutes)

  when +1
    minutes_left = int % 1440
    hh = minutes_left / 60
    mm = minutes_left % 60

  end

  format('%02d:%02d', hh, mm)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
=end
