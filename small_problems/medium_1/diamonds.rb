# diamonds.rb

def line(stars, spaces)
  (' ' * spaces) + ('*' * stars) + (' ' * spaces)
end

def diamond_top(int)
  i = 1
  loop do
    puts line(i, (int - i) / 2)
    i += 2
    break if i > int
  end
end

def diamond_bottom(int)
  return if int <= 1
  i = int - 2
  loop do
    puts line(i, (int - i) / 2)
    i -= 2
    break if i < 1
  end
end

def diamond(int)
  diamond_top(int)
  diamond_bottom(int)
end

diamond(1)
puts "next"
diamond(3)
puts "next"
diamond(5)