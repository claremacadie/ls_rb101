# print.rb

choice = ''

loop do
  puts ">> Do you want me to print something? (y/n)"
  choice = gets.chomp.downcase

  break if %w(y n).include?(choice)
  puts "That was not a valid response. Try again."
end

puts 'Something' if choice == 'y'