# featured.rb

def no_repeated_digits?(n)
  string = n.to_s
  string.chars == string.chars.uniq
end

def featured(n)
  first_7_mult = 0
  for i in n..(n + 7)
    first_7_mult = i if i % 7 == 0
  end

  featured_num = 0
  num = first_7_mult
  loop do
    return num if (num.odd? && no_repeated_digits?(num))
    num += 7
    break if num >= 9_876_543_210
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
