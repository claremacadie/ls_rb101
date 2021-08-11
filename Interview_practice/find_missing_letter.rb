# find_missing_letter.rb

# Find the missing letter
# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.
#
# You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
#
# The array will always contain letters in only one case.

# Example:
#
# ['a','b','c','d','f'] -> 'e'
# ['O','Q','R','S'] -> 'P'

# Use the English alphabet with 26 letters.

# input: an array of strings
# output: string

# Rewrite problem
# Identify which letter is missing from an array containing consecutive letters. My solution should allow for case-sensitive arrays.

# Pseudocode
# - Initialize a constant containing the letters of the alphabet
# - Extract complete array from constant (using first element and size of given array)
# - Iterate through complete array and compare each element against given array
# - Extract first element that is not the same in both arrays

# Code

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def get_complete_array(array)
  first_char = array[0]
  size = array.size + 1
  first_index = ALPHABET.index(first_char)
  ALPHABET.slice(first_index, size)
end


def find_missing_letter(array)
  complete_arr = get_complete_array(array)

  complete_arr.each_with_index do |char, index|
    return char if char != array[index]
  end
end

# Test cases
p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"
