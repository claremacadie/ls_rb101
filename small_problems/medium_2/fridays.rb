# fridays.rb

require 'date'

def fridays(year)
  first_friday = 0
  for i in 1..7
    first_friday = i if Date.new(year, 1, i).friday?
  end

  date_first_friday = Date.new(year, 1, first_friday)
  last_day_of_year = Date.new(year, 12, 31)

  days_after_first_friday = last_day_of_year - date_first_friday
  days_after_first_friday.to_s[0..2].to_i / 7


end

p fridays(2021)
p fridays(2020)