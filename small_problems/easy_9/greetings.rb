# greetings.rb

def greetings(arr, hsh)
  "Hello, #{arr.join(' ')}!" \
  "Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."