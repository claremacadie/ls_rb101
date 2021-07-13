# opposites.rb

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_number
  loop do
    puts ">> Please enter a positive or negative integer:"
    number = gets.chomp
    return number if valid_number?(number)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
end

def get_input
  first_num = ''
  second_num = ''
  loop do
    first_num = get_number
    second_num = get_number
    break if first_num.to_i * second_num.to_i < 0
    puts ">> Sorry. One integer must be positive, one must be negative."
    puts ">> Please start over."
  end
  return [first_num, second_num]
end

input = get_input
result = input[0].to_i + input[1].to_i

puts "#{input[0]} + #{input[1]} = #{result}"
