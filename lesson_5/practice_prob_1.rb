# practice_prob_1.rb

arr = ['10', '11', '9', '7', '8']

# model solution

new_arr = arr.sort do |a,b|
  b.to_i <=> a.to_i
end

p new_arr

# my solution
=begin new_arr = arr.sort_by do |num|
  -num.to_i
end

p new_arr
=end

# simple solution
=begin
num_arr = arr.map { |str| str.to_i }
num_arr.sort!
p num_arr.map { |num| num.to_s }
=end