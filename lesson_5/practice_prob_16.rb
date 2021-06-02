# practice_prob_16.rb

HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
SECTION_SIZE = [8, 4, 4, 4, 12]

id = SECTION_SIZE.each_with_object('') do |num, id|
  num.times {id << HEX.sample}
  id << '-' if num != 12
end

p id
