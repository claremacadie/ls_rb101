# sum.rb

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  return (puts "That's correct!") if answer == 4
  puts "Wrong answer. Try again!"
end