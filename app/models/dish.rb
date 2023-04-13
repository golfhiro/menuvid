class Dish < ApplicationRecord
  validates :name, presence: true

  has_many :menus, dependent: :destroy
  has_one :video, dependent: :destroy
  has_many :dish_genre_tags, dependent: :destroy
  has_many :genre_tags, through: :dish_genre_tags
  has_many :dish_ingredient_tags, dependent: :destroy
  has_many :ingredient_tags, through: :dish_ingredient_tags

end
