class TopsController < ApplicationController
  include YoutubeApi

  def index
    @videos =  Video.order('RANDOM()').limit(2)
  end
end
