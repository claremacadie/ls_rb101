# rotate_rightmost_digits.rb

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, n)
  left = num.to_s.slice(0..-(n+1))
  right = num.to_s.slice(-n..-1)
  rotate_right = rotate_array(right.chars).join
  new_num = (left + rotate_right).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
