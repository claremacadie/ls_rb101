# Teddy.rb

def how_old?
  age = rand(20..200)
end

def get_name
  puts "What is the name of the Teddy?"
  name = gets.chomp
  name = 'Teddy' if name.empty?
  name
end

def sentence
  age = how_old?
  name = get_name
  puts "#{name} is #{age} years old!"
end

sentence