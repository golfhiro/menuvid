class TopsController < ApplicationController
  require 'google/apis/youtube_v3'

  def index
    #Dishモデルからランダムに名前を取得
    select_dishes =  Dish.pluck(:name).sample(2)
    # @menus = Rails.cache.fetch('menu', expires_in: 12.hours) do
    @menus = []
      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = Rails.application.credentials.youtube_api[:youtube_api_key]

      select_dishes.each do |dish|
        # 検索結果を取得
        @menus += youtube.list_searches(
          :snippet,
          type: "video",
          q: dish + " " + "レシピ",
          max_results: 1,
          # 関連度が高い順
          order: "relevance",
        ).items
      end
      # binding.pry
    # end
  end
end
# youtube.list_searches(:snippet, type: "video", q: dish + " " + "レシピ", max_results: 1,order: "relevance",)
