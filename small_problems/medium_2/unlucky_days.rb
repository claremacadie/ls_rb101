# unlucky_days.rb

require 'date'

def friday_13th(year)
  count = 0
  for i in 1..12
    count += 1 if Date.new(year, i, 13).friday?
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
