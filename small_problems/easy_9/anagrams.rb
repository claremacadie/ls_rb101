# anagrams.rb

def anagrams(arr)
  anagrams = []

  arr.each_with_index do |word, index|
    sub_anagrams = [word]

    for i in (index + 1)..((arr.size) - 1)
      if word.chars.sort.join == arr[i].chars.sort.join
        sub_anagrams << arr[i]
      end
    end

    if sub_anagrams.size > 1 && anagrams.flatten.include?(word) == false
      anagrams << sub_anagrams
    end

  end

  anagrams.each { |arr| p arr }

end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams(words)