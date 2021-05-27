# left_triangle.rb

def triangle(num)
  for i in 1..num
    puts (('*' * i) + ' ' * (num - i))
  end
end

triangle(5)
triangle(9)