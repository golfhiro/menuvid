class Dish < ApplicationRecord
  validates :name, presence: true

  has_many :menus, dependent: :destroy
  has_one :video, dependent: :destroy
end
