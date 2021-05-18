# sum_or_product_fe.rb

def valid_integer?(num)
  num.to_i.to_s == num
end

def sum(num)
  (1..num).inject { |sum, n| sum + n }
end

def product(num)
  (1..num).inject { |product, n| product * n }
end

def gets_integer
  loop do
    puts ">> Please enter an integer greater than 0:"
    integer = gets.chomp
    return integer if valid_integer?(integer)
    puts "Hmm, that doesn't look like a valid integer. Try again."
  end
end

integer = gets_integer.to_i
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