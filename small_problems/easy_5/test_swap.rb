# test_swap.rb

def swap_first_last_characters(a, b)
  a, b = b, a
end


word = 'wonderful'
p swap_first_last_characters(word[0], word[-1])


