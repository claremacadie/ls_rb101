# repeat.rb

def repeat(str, num)
  num.times {puts str}
end

repeat('Hello', 3)

# odd.rb

def is_odd?(num)
  num.remainder(2) != 0
end

puts is_odd?(2) == false
puts is_odd?(5) == true
puts is_odd?(-17) == true
puts is_odd?(-8) == false
puts is_odd?(0) == false
puts is_odd?(7) == true

# list.rb

def digit_list(num)
  str = num.to_s
  arr = str.chars.each_with_object([]) do |char, arr|
    arr << char.to_i
  end
  arr
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# count.rb

def count_occurrences(arr)
  types = arr.uniq
  hsh_count = types.each_with_object({}) do |vehicle, hsh|
    hsh[vehicle.downcase] = 0
  end
  arr.each do |vehicle|
    hsh_count[vehicle.downcase] += 1
  end

  hsh_count.each do |k, v|
    puts "#{k} => #{v}"
  end
end

vehicles = [
  'car', 'CAR', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# reverse.rb

def reverse_sentence(str)
  str.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

def reverse_words(str)
  word_arr = str.split

  word_arr.map! do |word|
    if word.size >= 5
      word.chars.reverse.join
    else
      word
    end
  end
  word_arr.join(' ')
end

puts reverse_words('Professional') == 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School') == 'hcnuaL loohcS'

# stringy.rb

def stringy(num, first = '1')
  first == '1' ? second = '0' : second = '1'
  counter = 1
  str = ''
  loop do
    counter.odd? ? str << first : str << second
    counter += 1
    break if counter > num
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(7, '0') == '0101010'

# average.rb

def average(arr)
  arr.sum.to_f / arr.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40

# sum.rb

def sum(num)
  arr = num.to_s.split('')

  sum = arr.reduce(0) do |sum, num|
    sum + num.to_i
  end
  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# calculate_bonus.rb

def calculate_bonus(num, bool)
  bool ? num / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000



def test_method
  2
  return

end

p test_method
