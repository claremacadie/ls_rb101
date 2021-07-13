# star.rb

def top_star(n)
  i = (n - 1) / 2
  loop do
    puts (
      (' ' * ((n - 1 - 2 * i) / 2)) +
      '*' +
      (' ' * (i - 1)) +
      '*' +
      (' ' * (i - 1)) +
      '*' +
      (' ' * ((n - 1 - 2 * i) / 2))
    )
    i -= 1
    break if i < 1
  end
end

def bottom_star(n)
  i = 1
  loop do
    puts (
      (' ' * ((n - 1 - 2 * i) / 2)) +
      '*' +
      (' ' * (i - 1)) +
      '*' +
      (' ' * (i - 1)) +
      '*' +
      (' ' * ((n - 1 - 2 * i) / 2))
    )
    break if i >= ((n - 1) / 2)
    i += 1
  end
end

def middle_star(n)
 puts ('*' * n)
end

def star(n)
  top_star(n)
  middle_star(n)
  bottom_star(n)
end

star(7)
puts
puts
star(9)