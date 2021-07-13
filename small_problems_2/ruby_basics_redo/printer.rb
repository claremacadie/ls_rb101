# printer.rb

input = ''

loop do
  puts ">> How many lines to you want? Enter a number >= 3:"
  input = gets.chomp.to_i

  break if input >= 3
  puts ">> That is not a number greater than or equal to 3. Try again."
end

input.times do
  puts "Launch School is the best!"
end