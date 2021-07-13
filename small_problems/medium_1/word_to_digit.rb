# word_to_digit.rb

# my solution with gsub!
DIGITS = {"zero" => "0", "one" => "1", "two" => "2", "three" => "3", "four" => "4",
          "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9" }

def word_to_digit(string)
  DIGITS.each { |k, v| string.gsub!(k, v) }
  p string
end

# my solution without gsub!
=begin
DIGITS = {"zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4,
          "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9 }

PUNCTUATION = %w(. , ! ? \( \) [ ] " ' : ;)

def word_to_digit(string)
  words = string.split

  new_array = []
  words.each do |word|
    if PUNCTUATION.include?(word[-1])
      new_word = word[0...-1]
      if DIGITS.keys.include?(new_word.downcase)
        new_array << "#{DIGITS.fetch(new_word)}#{word[-1]}"
      else
        new_array << word
      end
    else
      if DIGITS.keys.include?(word.downcase)
        new_array << "#{DIGITS.fetch(word)}"
      else
        new_array << word
      end
    end
  end

  p new_array.join(' ')
end
=end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
