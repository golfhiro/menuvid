class Dish < ApplicationRecord
  validates :name, presence: true

  # attr_accessor :select_dishes

  # def initialize
  #   super
  #   @select_dishes = Dish.order("RANDOM()").limit(1)
  # end
end
