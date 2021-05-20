# counting_characters.rb

puts "Please write word or multiple words:"
string = gets.chomp

number_of_characters = string.delete(' ').size

puts "There are #{number_of_characters} characters in '#{string}'."