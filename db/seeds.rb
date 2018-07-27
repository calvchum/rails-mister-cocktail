Ingredient.delete_all

require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

ingredient["drinks"].each_index do |i|
  item = ingredient["drinks"][i]['strIngredient1']
  Ingredient.create(name: item)
end

puts "Created #{Ingredient.count} Ingredients"
