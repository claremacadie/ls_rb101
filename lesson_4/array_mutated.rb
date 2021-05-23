# array_mutated.rb

=begin numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  p numbers
  numbers.shift(1)
  p numbers
end
=end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end