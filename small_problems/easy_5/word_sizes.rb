# word_sizes.rb

def word_sizes(str)
  word_lengths = str.split.each_with_object([]) { |word, a| a << word.size }
  word_lengths_count = word_lengths.uniq.each_with_object({}) do |num, h|
    h[num] = word_lengths.count(num)
  end
  word_lengths_count
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
