class Menu < ApplicationRecord
  belongs_to :user
  belongs_to :dish

  scope :this_week, -> { where(date: Date.today.beginning_of_week..Date.today.end_of_week).includes(:dish).order(date: :asc) }
end
