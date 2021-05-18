# greeting.rb

puts "What is your name?"
name = gets.chomp
array = name.split('')

if array.last == "!"
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# alternative if name[-1] == '!'