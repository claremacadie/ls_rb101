# hard1_q4_regex.rb

def is_an_ip_number?(string)
  (string.to_i >= 0) && (string.to_i <= 255) && (string == string.to_i.to_s)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

p dot_separated_ip_address?("10.4.5.11")
p dot_separated_ip_address?("10.4.5.11.43")
p dot_separated_ip_address?("10.4.5.300")
p dot_separated_ip_address?("apple")
p dot_separated_ip_address?("10")
p dot_separated_ip_address?("a.v.f.d.e")