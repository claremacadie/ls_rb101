# power.rb

def multiply(x, y)
  x * y
end

def power(x, n)
  if n > 2
    multiply(x, power(x, n-1))
  else
    multiply(x, x)
  end
end

puts power(3, 3) # => 27
puts power(4, 7) # => 16384