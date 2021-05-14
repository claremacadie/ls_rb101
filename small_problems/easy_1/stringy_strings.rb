# stringy_strings.rb

def stringy(int, bin = 1)
  string = ''
  for i in 1..int
    n = ''
    bin == 1 ? n = i : n = i + 1
    n.even? ? string << '0' : string << '1'
  end
  string
end

puts stringy(6) == '101010'
puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'