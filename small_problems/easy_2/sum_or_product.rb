# sum_or_product.rb

def gets_integer
  puts ">> Please enter an integer greater than 0:"
  integer = gets.chomp.to_i
end

def sum(num)
  sum = 0
  1.upto(num) { |val| sum += val }
  sum
end

def product(num)
  product = 1
  1.upto(num) { |val| product *= val }
  product
end

integer = gets_integer
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  answer = sum(integer)
  operation_name = "sum"
elsif operation == 'p'
  answer = product(integer)
  operation_name = "product"
else
  puts "Oops. Unknown operation."
end

puts "The #{operation_name} of the integers between 1 and #{integer} is #{answer}."