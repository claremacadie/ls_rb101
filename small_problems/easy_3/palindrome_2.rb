# palindrome_2.rb

def real_palindrome?(input)
  input.downcase!
  alphanumeric = ""
  input.each_char do |char|
      alphanumeric << char if ( (char >= "a") && (char <= "z") )
  end

  alphanumeric == alphanumeric.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
