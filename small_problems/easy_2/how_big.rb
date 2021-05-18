# how_big.rb

puts "Enter the length of the room in metres:"
length = gets.chomp.to_f

puts "Enter the width of the room in metres:"
width = gets. chomp.to_f

SQMETRES_TO_SQFEET = 10.7639

area_in_metres = (length * width).round(2)
area_in_sqft = (area_in_metres * SQMETRES_TO_SQFEET).round(2)

puts "The area of the room is #{area_in_metres} square metres (#{area_in_sqft} square feet)."