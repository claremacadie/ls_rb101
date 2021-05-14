# reverse_2.rb

def reverse_words(string)
  words = string.split
  words.map! do |word|
    word.length < 5 ? word : word.reverse
  end
  words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')