# string_to_integer.rb

CONVERSION_HASH = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
}

def string_to_integer(string)
  number_array = string.chars.map { |char| CONVERSION_HASH[char] }

  number = 0
  number_array.each { |val| number = number * 10 + val}
  number
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570