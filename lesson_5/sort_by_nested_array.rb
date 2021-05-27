# sort_by_nested_array.rb

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

p arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end

p arr