# lsprinter.rb

def print_lines(num)
  while num > 0
    puts 'Launch School is the best!'
    num -= 1
  end
end

number_of_lines = ''
loop do
  loop do
    puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
    number_of_lines = gets.chomp
    return if number_of_lines.downcase == 'q'
    break if number_of_lines.to_i >= 3
    puts ">> That's not enough lines."
  end
  print_lines(number_of_lines.to_i)
end
