# max_rotation.rb

require 'pry'

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_array(array, n)
  left = array[0..-(n+1)]
  right = array[-n..-1]
  rotate_right = rotate_array(right)
  new_array = left + rotate_right
end

def max_rotation(num)
  string_array = num.to_s.chars
  i = string_array.size
  loop do
    string_array = rotate_rightmost_array(string_array, i)
    i -= 1
    break if i == 0
  end
  string_array.join.to_i
end

p max_rotation(1000001)
p max_rotation(735291) == 321579
=begin
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
=end
