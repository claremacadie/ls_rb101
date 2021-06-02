# repeater.rb

def repeater(str)
  new_arr = str.chars.each_with_object([]) do |char, arr|
    arr << char << char
  end.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
