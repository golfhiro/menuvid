class TopsController < ApplicationController
  require 'google/apis/youtube_v3'

  def index
    @videos =  Video.order('RANDOM()').limit(2)
  end
end
