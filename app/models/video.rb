class Video < ApplicationRecord
  validates :name, presence: true
  validates :video_id, presence: true
  validates :thumbnail, presence: true
end
