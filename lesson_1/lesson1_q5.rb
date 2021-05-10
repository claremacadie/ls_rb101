# lesson1_a5.rb

# first option
def string_lengths(sentence)
  strings = sentence.split

  strings.map { |chars| chars.length }
end

puts 'first option'
p string_lengths('a gg hhh a')


#second option, added return lengths to make it work
def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
  return lengths
end

puts 'second option'
p string_lengths('a gg hhh a')


# third option, works
def string_lengths(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end

puts 'third option'
p string_lengths('a gg hhh a')


#fourth option, changed counter == to counter > to make it work
def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter > strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

puts 'fourth option'
p string_lengths('a gg hhh a')
