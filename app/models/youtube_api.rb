module YoutubeApi
#   require 'google/apis/youtube_v3'

#     # キャッシュに保存された結果があればそれを返す
#     @menus = Rails.cache.fetch('menu', expires_in: 12.hours) do
#       # キャッシュに保存された結果がない場合、新しく検索を行う
#       # 料理のキーワードを用意
#       # dishes = ["生姜焼き", "とんかつ", "カレー",]
#       # dish = dishes.sample

#       youtube = Google::Apis::YoutubeV3::YouTubeService.new
#       youtube.key = Rails.application.credentials.youtube_api[:youtube_api_key]

#         # YouTube APIを使用して動画を検索
#         result_response = youtube.list_searches(
#           'snippet',
#           q: "#{@select_dish}" + "レシピ",
#           type: 'video',
#           order: "relevance",
#           max_results: 1,
#         )
#     end
# end

# module YoutubeApi
#   require 'google/apis/youtube_v3'

#   # Youtube
#   def get_videos(query)
#     youtube = Google::Apis::YoutubeV3::YouTubeService.new
#     youtube.key = Rails.application.credentials.google[:youtube_api_key]

#     # 検索結果を取得
#     search_results = youtube.list_searches(
#       :snippet,
#       type: "video",
#       q: query[:spot_name_ens] + " " +"walking tour 4k",
#       max_results: 24,
#       # 埋め込み可能な動画のみを検索
#       video_embeddable: true,
#       # 関連度が高い順
#       order: "relevance",
#       fields: 'items(id(videoId), snippet(title, publishedAt,thumbnails(medium(url))))'
#     )
#   end

  # # Youtube動画を保存
  # def save_videos(results, query)
  #   results.each do |result|
  #     Video.create!(
  #       area: query[:area_name],
  #       spot: query[:spot_name],
  #       video_id: result[:video_id],
  #       title: result[:title],
  #       thumbnail: result[:thumbnail],
  #       view_count: result[:view_count],
  #       published_at: result[:published_at]
  #     )
  #   end
  # end
end
