# hexadecimal_to_integer.rb

CONVERSION_HASH = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
  "a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15
}

def hexadecimal_to_integer(string)
  string.downcase!
  number_array = string.chars.map { |char| CONVERSION_HASH[char] }

  number = 0
  number_array.each { |val| number = number * 16 + val}
  number
end

p hexadecimal_to_integer('4D9f') == 19871