class Video < ApplicationRecord
  belongs_to :dish

  validates :video_id, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true
  validates :thumbnail, presence: true, uniqueness: true

  def self.search_by_dish(dish)
    response = YoutubeService.list_searches(
      'snippet',
      q: dish.name + "レシピ",
      type: 'video',
      max_results: 1,
      # 関連度が高い順
      order: "relevance",
    ).items

    if response.present?
      video = Video.new(
        video_id: response.first.id.video_id,
        title: response.first.snippet.title,
        thumbnail: response.first.snippet.thumbnails.high.url,
        dish: dish
      )
      video.save
    end
  end

end
