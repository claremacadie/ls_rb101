# word_cap.rb

def word_cap(str)
  str_cap = str.split(' ')
  str_cap.map! do |word|
    chars = word.chars.each_with_index do |char, i|
      i == 0 ? char.upcase! : char.downcase!
    end
    chars.join
  end
  str_cap.join(' ')
end


# solution without capitalize
=begin def word_cap(str)
  arr = str.split(' ').each_with_object([]) do |word, arr|
    new_word = word.downcase
    new_word[0] = new_word[0].upcase
    arr << new_word
  end
  str_cap = arr.join(' ')
end
= end

# my solution
=begin
def word_cap(str)
  arr = str.split(' ').each_with_object([]) do |word, arr|
    arr << word.capitalize
  end
  str_cap = arr.join(' ')
end
=end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'