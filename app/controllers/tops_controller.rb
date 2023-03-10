class TopsController < ApplicationController
  require 'google/apis/youtube_v3'
  def index
    # キャッシュに保存された結果があればそれを返す
    @menus = Rails.cache.fetch('menu', expires_in: 12.hours) do
      # キャッシュに保存された結果がない場合、新しく検索を行う
      # 料理のキーワードを用意
      dishes = ["生姜焼き", "とんかつ", "カレー",]
      dish = dishes.sample

      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = Rails.application.credentials.youtube_api[:youtube_api_key]

        # YouTube APIを使用して動画を検索
        result_response = youtube.list_searches(
          'snippet',
          q: dish + "レシピ",
          type: 'video',
          order: "relevance",
          max_results: 1,
        )
    end
  end
end
