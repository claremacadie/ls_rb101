# center_of.rb

def center_of(str)
  middle = ((str.size) -1) / 2
  str.size.odd? ? str[middle] : str[middle].concat(str[middle + 1])
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
