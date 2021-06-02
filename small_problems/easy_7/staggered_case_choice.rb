# staggered_case_choice.rb

def staggered_case_choice(str, choice = 'first_up')
  new_chars = []
  str.chars.each_with_index do |char, i|
    if choice == 'first_up'
      i.even? ? char.upcase! : char.downcase!
      new_chars << char
    else
      i.odd? ? char.upcase! : char.downcase!
      new_chars << char
    end
  end
  new_str = new_chars.join
end

p staggered_case_choice('I Love Launch School!', 'first_up') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case_choice('ALL_CAPS', 'first_down') == 'aLl_cApS'
p staggered_case_choice('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
