# how_big_ft.rb

puts "Enter the length of the room in feet:"
length = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width = gets. chomp.to_f

SQFT_TO_SQINCHES = 144
SQFT_TO_SQCM = 929.03

area_in_sqft = (length * width).round(2)
area_in_sqinches = (area_in_sqft * SQFT_TO_SQINCHES).round(2)
area_in_sqcm = (area_in_sqft * SQFT_TO_SQCM).round(2)

puts "The area of the room is #{area_in_sqft} square feet " +
     "(#{area_in_sqinches} square inches and " +
     "#{area_in_sqcm} square centimetres)."