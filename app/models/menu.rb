class Menu < ApplicationRecord
  belongs_to :user
  belongs_to :dish

  def start_time
    self.date
  end
end
