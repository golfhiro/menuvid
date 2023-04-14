class GenreTag < ApplicationRecord
  has_many :dish_genre_tags, dependent: :destroy
  has_many :dishes, through: :dish_genre_tags

  validates :name, presence: true
end
