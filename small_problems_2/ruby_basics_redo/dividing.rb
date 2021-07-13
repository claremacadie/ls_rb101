# dividing.rb

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def get_numerator
  loop do
    puts ">> Please enter the numerator:"
    numerator = gets.chomp
    return numerator if valid_number?(numerator)
    puts ">> Invalid input. Only integers are allowed."
  end
end

def get_denominator
  loop do
    puts ">> Please enter the denominator:"
    denominator = gets.chomp

    if valid_number?(denominator) == false
      puts ">> Invalid input. Only integers are allowed."
    elsif denominator == "0"
      puts ">> Invalid input. A denominator of 0 is not allowed."
    else
      return denominator
    end
  end
end

numerator = get_numerator
denominator = get_denominator
result = numerator.to_i / denominator.to_i

puts "#{numerator} / #{denominator} is #{result}"
