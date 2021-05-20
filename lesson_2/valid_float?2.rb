# valid_float?.rb

def remove_trailing_zeros(number)
  while (number[-1] == "0" && number.length > 1)
    number.chop!
  end
end

def valid_float?(string)
  return false if string.include?('.') == false
  separated_number = string.split(".")
  return false if separated_number.size > 2
  fractional = separated_number[1]
  remove_trailing_zeros(fractional)
  float = separated_number[0] + "." + fractional
  float.to_f.to_s == float
end

p valid_float?("12.3")
p valid_float?("12.0")
p valid_float?("12.30")
p valid_float?("12.300")
p valid_float?("12.00300")
p valid_float?("12.00000300000")
p valid_float?("12.000003000.00")
p valid_float?("apple")
