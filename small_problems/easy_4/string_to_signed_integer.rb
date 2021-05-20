# string_to_signed_integer.rb

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

#further exploration on model solution
def string_to_signed_integer(string)
  string[0] == '-' ? sign = -1 : sign = 1
  ( string[0] == '-' || string[0] == '+' ) ? string = string[1..-1] : string
  sign * string_to_integer(string)
end

=begin my solution
def string_to_signed_integer(string)
  if string.start_with?("-")
    string.delete!("-")
    number = -string_to_integer(string)
  elsif string.start_with?("+")
    string.delete!("+")
    number = string_to_integer(string)
  else
    number = string_to_integer(string)
  end
end
=end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100