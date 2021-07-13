# word_to_digit_fe.rb

# my solution without gsub!
DIGITS = {"zero" => '0', "one" => '1', "two" => '2', "three" => '3', "four" => '4',
          "five" => '5', "six" => '6', "seven" => '7', "eight" => '8', "nine" => '9' }



PUNCTUATION = %w(. , ! ? \( \) [ ] " ' : ;)

def integer?(str)
  str.to_i.to_s == str
end

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

  loop do
    changed = false
    for i in 0..(new_array.size - 1)
      if integer?(new_array[i][0]) && integer?(new_array[i + 1][0])
        new_array[i] = new_array[i] + new_array[i + 1]
        new_array[i + 1] = ''
        changed = true
      end
    end
    new_array.delete('')
    break if changed == false
  end

  p new_array.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
