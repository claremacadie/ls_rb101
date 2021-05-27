# cleanup.rb

def remove_consecutive_spaces(string)
  characters = string.split('')
  for i in 0..(characters.size - 2)
   characters[i] = '' if (characters[i] == ' ') && (characters[i + 1] == ' ')
  end
  characters.join
end

def cleanup(str)
  characters = str.split('')
  clean_characters = []
  characters.each do |char|
    clean_characters << ( ( char >= 'a' ) && ( char <= 'z' ) ? char : ' ' )
  end
  clean_sentence = clean_characters.join('')
  remove_consecutive_spaces(clean_sentence)
end

p cleanup("---what's my +*& line?") == ' what s my line '