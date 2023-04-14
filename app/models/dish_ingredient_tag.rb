class DishIngredientTag < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient_tag
end
