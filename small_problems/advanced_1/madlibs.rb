# madlibs.rb

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS = %w(fox dog head leg).freeze
VERBS = %w(jumps lifts bites licks).freeze
ADVERBS = %w(easily lazily noisily excitedly).freeze

def word_substitute(word)
  case
  when word.include?("<adjective>") then word.gsub("<adjective>", ADJECTIVES.sample)
  when word.include?("<noun>") then word.gsub("<noun>", NOUNS.sample)
  when word.include?("<verb>") then word.gsub("<verb>", VERBS.sample)
  when word.include?("<adverb>") then word.gsub("<adverb>", ADVERBS.sample)
  else
    word
  end
end

def madlibs(text)
  puts text.split.map { |word| word_substitute(word) }.join(' ')
end

madlibs("The <adjective> brown <noun> <adverb> <verb> the <adjective> yellow " \
"<noun>, who <adverb> <verb> his <noun> and looks around.")