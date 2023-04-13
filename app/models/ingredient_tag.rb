class IngredientTag < ApplicationRecord
  has_many :dish_ingredient_tags, dependent: :destroy
  has_many :dishes, through: :dish_ingredient_tags

  validates :name, presence: true
end
