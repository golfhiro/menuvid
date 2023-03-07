class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 100}
  validates :password, length: { minimum: 3 }, confirmation: true

end
