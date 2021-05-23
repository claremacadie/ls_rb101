# titleize.rb

def titleize(string)
  words_array = string.split(' ')
  words_array.map! { |word| word.capitalize! }
  words_array.join(' ')
end

p words = "the flintstones rock"
p titleize(words)

