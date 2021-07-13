# diamonds.rb

def middle_line(middle, edge)
  (" " * edge) + "*" + (" " * middle) + "*" + (" " * edge)
end

def end_line(stars, spaces)
  (' ' * spaces) + ('*' * stars) + (' ' * spaces)
end

def diamond_top(int)
  if int == 1
    puts "*"
    return
  end
  i = 1
  loop do
    if i == 1
      puts end_line(i, (int - i) / 2)
    else
      middle = (2 * i) - 3
      edge = (int - 2 - middle) / 2
      puts middle_line(middle, edge)
    end
    i += 1
    break if i > (int / 2) + 1
  end
end

def diamond_bottom(int)
  return if int <= 1
  i = int / 2
  i
  loop do
    if i == 1
      puts end_line(i, (int - i) / 2)
    else
      middle = (2 * i) - 3
      edge = (int - 2 - middle) / 2
      puts middle_line(middle, edge)
    end
    i -= 1
    break if i < 1
  end
end

def diamond(int)
  diamond_top(int)
  diamond_bottom(int)
end

diamond(7)