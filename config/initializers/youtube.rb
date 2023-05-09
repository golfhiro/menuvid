require 'google/apis/youtube_v3'

if Rails.application.credentials.youtube_api
  YOUTUBE_API_KEY = Rails.application.credentials.youtube_api[:youtube_api_key]

  Google::Apis::ClientOptions.default.application_name = 'MyApp'
  Google::Apis::ClientOptions.default.application_version = '1.0'
  Google::Apis::RequestOptions.default.retries = 3

  YoutubeService = Google::Apis::YoutubeV3::YouTubeService.new
  YoutubeService.key = YOUTUBE_API_KEY
end
