# letter_swap.rb

def reverse_word(str)
  if str.length == 1
    reverse_word = str
  else
    first_letter = str[0]
    last_letter = str[-1]
    middle_word = str.delete_prefix(first_letter).delete_suffix(last_letter)
    reverse_word = last_letter + middle_word + first_letter
  end
  reverse_word
end

def swap(str)
  words = str.split(' ')
  words_reversed_array = []
  words.each do |word|
    words_reversed_array << reverse_word(word)
  end
  words_reversed_array.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'