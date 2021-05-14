# odd.rb

def is_odd?(integer)
  integer % 2 == 1 ? true : false
end

p is_odd?(4)
p is_odd?(9)

def is_odd_remainder?(integer)
  integer.remainder(2) == 1 || integer.remainder(2) == -1
end

p is_odd_remainder?(-6)
p is_odd_remainder?(-7)