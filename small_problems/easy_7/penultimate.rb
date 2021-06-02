# penultimate.tb

def penultimate(str)
  words = str.split
  words[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'