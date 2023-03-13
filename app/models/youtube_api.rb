module YoutubeApi
  require 'google/apis/youtube_v3'
  #Dishモデルからランダムに名前を取得
  select_dishes =  Dish.pluck(:name).sample(31)
  # @menus = Rails.cache.fetch('menu', expires_in: 12.hours) do
  # @menus = []

  youtube = Google::Apis::YoutubeV3::YouTubeService.new
  youtube.key = Rails.application.credentials.youtube_api[:youtube_api_key]

  select_dishes.each do |dish|
    # 検索結果を取得
    results = youtube.list_searches(
      :snippet,
      type: "video",
      q: dish + " " + "レシピ",
      max_results: 1,
      # 関連度が高い順
      order: "relevance",
    ).items

    results.each do |result|
      video = Video.new(
        video_id: result.id.video_id,
        title: result.snippet.title,
        thumbnail: result.snippet.thumbnails.high.url
      )
      video.save
    end
  end
end
