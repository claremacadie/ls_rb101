# twice.rb

def double_number?(num)
  num_length = num.to_s.length
  half = num_length / 2
  return false if num_length.odd?
  num.to_s[0..(half-1)] == num.to_s[half..(-1)] ? true : false
end

def twice(num)
  double_number?(num) ? num : 2 * num
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

