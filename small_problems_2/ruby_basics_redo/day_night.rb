# day_night.rb

daylight = [true, false].sample

def time_of_day(bool)
  puts (bool ? "It's daytime!" : "It's nighttime!")
end

time_of_day(daylight)

