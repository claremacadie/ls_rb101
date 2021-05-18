# searching101.rb

array = []
position = ["1st", "2nd", "3rd", "4th", "5th", "6th"]

for i in 0..4
  puts "==> Enter the #{position[i]} number:"
  array << gets.to_i
end

puts "==> Enter the last number:"
last = gets.to_i

if array.include?(last)
  puts "The number #{last} appears in #{array}."
else
  puts "The number #{last} does not appear in #{array}."
end
