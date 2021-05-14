# sum_of_digits.rb

def sum(int)
  array = int.to_s.split('')
  array.reduce { |sum, num| sum.to_i + num.to_i }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
