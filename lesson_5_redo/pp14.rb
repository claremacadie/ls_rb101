# pp14.rb

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each do |k, v|
  if v[:type] == "fruit"
    arr << ( v[:colors].map { |color| color.capitalize })
  elsif v[:type] == "vegetable"
    arr << v[:size].upcase
  end
end

p arr
