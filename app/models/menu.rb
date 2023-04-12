class Menu < ApplicationRecord
  belongs_to :user
  belongs_to :dish


  scope :this_week, -> { where(date: Date.today.beginning_of_week..Date.today.end_of_week).includes(:dish).order(date: :asc) }

  scope :last_week, -> { where(date: Date.today.prev_week.beginning_of_week..Date.today.prev_week.end_of_week).includes(:dish).order(date: :asc) }

  scope :two_weeks_ago, -> { where(date: Date.today.prev_week.prev_week.beginning_of_week..Date.today.prev_week.prev_week.end_of_week).includes(:dish).order(date: :asc) }

  scope :three_weeks_ago, -> { where(date: Date.today.prev_week.prev_week.prev_week.beginning_of_week..Date.today.prev_week.prev_week.prev_week.end_of_week).includes(:dish).order(date: :asc) }

  def start_time
    self.date
  end
end
