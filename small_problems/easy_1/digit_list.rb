# digit_list.rb

def digit_list(integer)
  integer.to_s.split('').map {|x| x.to_i}
end
  #alternative solution:
  #integer.to_s.chars.map(&:to_i)

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
