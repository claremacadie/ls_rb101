# crunch.rb

# model solution with regex
def crunch(text)
  p text
end

# model solution with String#chars
=begin def crunch(text)
  char_array = text.chars
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << char_array[index] unless char_array[index] == char_array[index + 1]
    index += 1
  end
  crunch_text
end
=end

# model solution
=begin def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end
=end

#my solution
=begin
def remove_duplicates(str)
  character_array = str.split('')
  for i in 0..(character_array.size - 2)
    character_array[i] = '' if (character_array[i] == character_array[i + 1])
  end
  character_array.join('')
end

def crunch(str)
  words = str.split
  words_no_duplicates = words.map { |word| remove_duplicates(word) }
  words_no_duplicates.join(' ')
end
=end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''