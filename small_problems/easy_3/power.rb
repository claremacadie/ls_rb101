# power.rb

def multiply(x, y)
  x * y
end

def power(num, index)
  if index == 0
    1
  elsif index == 1
    num
  elsif index == 2
    multiply(num, num)
  else
    num * power(num, index - 1)
  end
end

p power(2, 2) == 4
p power(2, 4) == 16
p power(3, 3) == 27
p power(4, 5) == 1024
p power(3, 1) == 3