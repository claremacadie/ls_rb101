# middle.rb

def middle(str)
  return '' if str.empty?
  words = str.split
  middle = ((words.size) -1) / 2
  words[middle]
end

p middle('This is in the middle') == 'in'
p middle('This is not in the middle') == 'not'
p middle('') == ''