# pp8.rb

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, v|
  v.join.each_char do |char|
    p char if ['a', 'e', 'i', 'o', 'u'].include?(char)
  end
end