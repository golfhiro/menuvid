class TopsController < ApplicationController
  include YoutubeApi

  def index
    @videos =  Video.order('RANDOM()').limit(31)

    @dates = (Date.today.beginning_of_month..Date.today.end_of_month).map { |date| date.strftime('%-m/%-d (%A)') }

    # @dates.each do |date_dish|
    #   @videos =  Video.order('RANDOM()').limit(31)
    # end

    # @next_dates = (Date.today.end_of_month.next_day..Date.today.end_of_month.next_month).map { |date| date.strftime('%-m/%-d (%A)')}
  end
end
