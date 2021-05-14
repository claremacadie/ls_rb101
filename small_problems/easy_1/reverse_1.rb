# reverse_1.rb

def reverse_sentence(string)
  words = string.split.reverse
  sentence = ''
  words.each { |word| sentence << (word + ' ') }
  sentence.chop
end

#alternatively: string.split.reverse.join(' ')

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'