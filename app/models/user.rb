class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true, length: {maximum: 20}, uniqueness: true
  validates :email, presence: true, length: {maximum: 100}, uniqueness: true
  validates :password, length: { minimum: 3 }, confirmation: true, uniqueness: true

end
