class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :menus, dependent: :destroy

  validates :name, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 100}, uniqueness: true
  validates :password, length: { minimum: 3 }, confirmation: true, if: -> { new_record? || changes[:crypted_password] }

  validates :reset_password_token, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1 }
end
