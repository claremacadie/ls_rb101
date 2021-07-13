# random_sentence.rb

def name(array)
  array.sample
end

def activity(array)
  array.sample
end

def sentence(n, a)
  "#{n} went #{a} today!"
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
