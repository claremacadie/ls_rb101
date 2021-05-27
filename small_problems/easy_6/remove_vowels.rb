# remove_vowels.rb

VOWELS = %w(a e i o u A E I O U)

def remove_vowels(array)
  array.map do |string|
    VOWELS.each { |vowel| string.delete!(vowel) }
  end
  array
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']