class TopsController < ApplicationController
  # require 'google/apis/youtube_v3'

  def index
  #   # キャッシュに保存された結果があればそれを返す
  #   @menu = Rails.cache.fetch('menu', expires_in: 12.hours) do
  #     # キャッシュに保存された結果がない場合、新しく検索を行う
  #     # 材料のキーワードを用意
  #     # ingredients = ["豚肉", "鶏肉", "鯖,", "牛肉", "鮭", "豆腐", "キャベツ", "挽肉", "海老", "白菜", "まぐろ"]
  #     # ジャンルのキーワードを用意
  #     # genres = ["和食", "洋食", "中華"]

  #     dishes = ["生姜焼き", "とんかつ", "カレー",]

  #     # 1週間分の献立を用意
  #     menu = {}

  #     select_ingredient = ingredients.sample(7)

  #     youtube = Google::Apis::YoutubeV3::YouTubeService.new
  #     youtube.key = Rails.application.credentials.youtube_api[:youtube_api_key]

  #     response = [];

  #     # response_2 = [];

  #     select_ingredient.each do |ingredient|
  #       genre = genres.sample
  #       # YouTube APIを使用して動画を検索
  #       result_response = youtube.list_searches('snippet', q: ingredient + "レシピ" + genre, type: 'video', order: "relevance", max_results: 2 )
  #       response << result_response[0].items.sample
  #     end

  #     %w[ Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each_with_index do |day, index|
  #       # 検索結果を1週間分の献立に追加
  #       menu[day] = [{ video_id: response[index].items.first.id.video_id }]
  #     end

  #     # 検索結果をキャッシュに保存する
  #     menu
  #   end
  end
end
