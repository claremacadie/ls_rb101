# neutralizer.

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

# model solution fixed
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

# initial solution
=begin
def neutralize(sentence)
  new_sentence_words = []
  words = sentence.split(' ')
  words.each do |word|
    new_sentence_words << word unless negative?(word)
  end

  new_sentence_words.join(' ')
end
=end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.