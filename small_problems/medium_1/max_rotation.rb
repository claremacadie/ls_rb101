# max_rotation.rb

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, n)
  left = num.to_s.slice(0..-(n+1))
  right = num.to_s.slice(-n..-1)
  rotate_right = rotate_array(right.chars).join
  new_num = (left + rotate_right).to_i
end

def max_rotation(num)
  i = num.to_s.size
  loop do
    num = rotate_rightmost_digits(num, i)
    i -= 1
    break if i == 0
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
