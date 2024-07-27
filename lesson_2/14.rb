# Given a hash, return an array with an element for each hash pair. Each hash key
# has a hash value. If the value for `:type` is `'fruit'`, return the value for `:colors`
# with each string array element capitalized. If the value for `:type` is `'vegetable'`,
#  return the value for `:size`, with the characters converted to uppercase.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |key, hash|
  if hash[:type] == 'fruit'
    hash[:colors].map { |color| color.capitalize }
  else
    hash[:size].upcase
  end
end
