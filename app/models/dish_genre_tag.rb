class DishGenreTag < ApplicationRecord
  belongs_to :dish
  belongs_to :genre_tag
end
