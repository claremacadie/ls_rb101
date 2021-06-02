# staggered_case.rb

def staggered_case(str)
  new_chars = []
  str.chars.each_with_index do |char, i|
    i.even? ? char.upcase! : char.downcase!
    new_chars << char
  end
  new_str = new_chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
