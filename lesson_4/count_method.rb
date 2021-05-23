# count_method.rb

array = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p array