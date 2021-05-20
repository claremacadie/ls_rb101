# valid_float?.rb

def remove_trailing_zeros(array)
  while array.last == '0'
      array.pop
  end
  if array.empty?
    array = ["0"]
  else
    array.join
  end
end

def valid_float?(string)
  return false if string.include?('.') == false
  separated_number = string.split(".")
  return false if separated_number.size > 2
  fractional_separated = separated_number[1].split('')
  fractional_separated_no_trailing_zeros = remove_trailing_zeros(fractional_separated)
  new_float = separated_number[0] + "." + fractional_separated_no_trailing_zeros[0]
  new_float.to_f.to_s == new_float
end

p valid_float?("12.3")
p valid_float?("12.0")
p valid_float?("12.30")
p valid_float?("12.300")
p valid_float?("12.00300")
p valid_float?("12.00000300000")
p valid_float?("12.000003000.00")
p valid_float?("apple")
