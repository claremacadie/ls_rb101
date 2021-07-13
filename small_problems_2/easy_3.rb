# easy_3.rb

=begin
POSITIONS = %w(1st 2nd 3rd 4th 5th last)

num_array = []

POSITIONS.each do |position|
  puts "==> Enter the #{position} number:"
  num = gets.chomp.to_i
  num_array << num
end

last = num_array.pop

if num_array.include?(last)
  puts "The number #{last} appears in #{num_array}."
else
  puts "The number #{last} does not appear in #{num_array}."
end


# arithmetic.rb
puts "==> Enter the first number:"
first_num = gets.chomp.to_f
second_num = ''
loop do
  puts "==> Enter the second number:"
  second_num = gets.chomp.to_f
  break if second_num != 0
  puts "==> Number must not be zero."
end
puts "==> #{first_num} + #{second_num} = #{first_num + second_num}"


# counting_characters.rb

puts "Please write word or multiple words:"
words = gets.chomp

count = words.delete(' ').size

puts "There are #{count} characters in \"#{words}\"."


# multiplying.rb

def multiply(x, y)
  x * y
end

p multiply(5, 3) == 15
p multiply([0, 1], 3)


# square.rb

def square(num)
  multiply(num, num)
end

p square(5) == 25
p square(-8) == 64


def power(num, index)
  if index == 0
    1
  elsif index == 1
    num
  else
    num * power(num, index - 1)
  end
end

p power(2, 2) == 4
p power(2, 4) == 16
p power(3, 3) == 27
p power(4, 5) == 1024


# xor.rb

def xor?(a, b)
  return false if (a == true && b == true)
  return false if (a == false && b == false)
  true
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false


# odd.rb

def oddities(arr)
  new_arr = []
  arr.each_with_index do |num, i|
    new_arr << num if i.even?
  end
  new_arr
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []


# palindrome.rb

def palindrome?(str)
  str.reverse == str
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([1, 2, 3, 2, 1]) == true

=end

# real_palindrome?.rb

def real_palindrome?(str)
  str.downcase!
  alphanumeric_array = str.chars.select do |char|
    (char > 'A' && char < 'z') || (char > '0' && char < '9')
  end

  alphanumeric_array == alphanumeric_array.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

