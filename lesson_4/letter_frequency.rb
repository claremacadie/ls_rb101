# letter_frequency.rb


def number_of_char(array, char)
  array_of_chars = array.select { |element| element == char }
  array_of_chars.size
end

def letter_frequency(string)
  char_array = string.chars
  char_array_uniq = char_array.uniq
  frequency_hash = {}
  char_array_uniq.each do |char|
    frequency_hash[char] = number_of_char(char_array, char)
  end
  p frequency_hash
end


statement = "The Flintstones Rock"
letter_frequency(statement)
