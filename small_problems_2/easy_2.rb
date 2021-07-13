# easy_2.rb

=begin
# Teddy.rb

age = rand(20..200)
puts "What is the name?"
name = gets.chomp
name = "Teddy" if name.empty?
puts "#{name.capitalize} is #{age} years old!"


# area.rb

puts "Enter the length of the room in feet:"
length = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width = gets.chomp.to_f

CONVERSION_SQFT_IN = 144
CONVERSION_SQFT_CM = 929.03

area_in_sqft = length * width
area_in_sqin = area_in_sqft * CONVERSION_SQFT_IN
area_in_sqcm = area_in_sqft * CONVERSION_SQFT_CM

puts "The area of the room is #{area_in_sqft} square feet " + \
     "(#{format("%0.2f", area_in_sqin)} square inches " + \
     "(#{format("%0.2f", area_in_sqcm)} square cm)."


# tip.rb

puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f

tip = bill * (tip_percentage / 100)
total = bill + tip

puts "The tip is $#{format("%0.2f", tip)}"
puts "The total is $#{format("%0.2f", total)}"


# retire.rb

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

CURRENT_YEAR = Time.now.year

work_years = retirement_age - age
retirement_year = CURRENT_YEAR + work_years

puts "It's #{CURRENT_YEAR}. You will retire in #{retirement_year}."
puts "You only have #{work_years} years of work to go!"

# greeting.rb

puts "What is your name?"
name = gets.chomp!

if name[-1] == "!"
  puts "HELLO #{name.chop!.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize}."
end


# odd.rb

1.upto(99) do |num|
  puts num if num.odd?
end

odd = (1..99).select { |num| num.odd? }
puts odd


# even.rb

1.upto(99) { |num| puts num if num.even? }


# product.rb

def sum(int)
  (1..int).reduce(0) { |sum, num| sum += num }
end

def product(int)
  (1..int).reduce(1) { |sum, num| sum *= num }
end

def valid_integer?(int)
  int == int.to_i.to_s
end

integer = ''
operation = ''
loop do
  puts ">> Please enter an integer greater than 0:"
  integer = gets.chomp
  break if valid_integer?(integer)
  puts "That is not a valid integer, try again."
end

integer = integer.to_i

loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  break if %w(s p).include?(operation)
  puts "That is not a valid operation, try again."
end

if operation == 's'
  puts "The sum of the integers between 1 and #{integer} is #{sum(integer)}."
elsif operation == 'p'
  puts "The product of the integers between 1 and #{integer} is #{product(integer)}."
end

=end




