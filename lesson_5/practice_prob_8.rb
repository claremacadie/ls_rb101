# practice_prob_8.rb

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
VOWELS = %w(a e i o u)


hsh.each do |k, v|
  v.each do |w|
    w.chars.each do |char|
      print char if VOWELS.include?(char)
    end
  end
end
puts