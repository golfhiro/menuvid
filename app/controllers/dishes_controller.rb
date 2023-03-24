class DishesController < ApplicationController
  require 'google/apis/youtube_v3'

  def new
    @dish = Dish.new
    @dishes = Dish.all
  end

  def search_videos
    @dish = Dish.find(params[:dish_id])

    # YouTube APIの呼び出しと、取得した動画をVideoモデルに保存する処理を実装する
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.youtube_api[:youtube_api_key]

    search_response = youtube.list_searches(
      'snippet',
      q: @dish.name + "レシピ",
      type: 'video',
      max_results: 1,
      # 関連度が高い順
      order: "relevance",
    ).items

    if search_response.present?
      video = Video.new(
        video_id: search_response.first.id.video_id,
        title: search_response.first.snippet.title,
        thumbnail: search_response.first.snippet.thumbnails.high.url,
        dish: @dish # VideoとDishを関連付ける
      )
      video.save
    end

    redirect_to action: 'index'
  end

  def index
    @videos = Video.all
  end
end
