class TopsController < ApplicationController
  # include YoutubeApi

  def index
    @videos =  Video.order('RANDOM()').limit(7)

    @dates = (Date.today.beginning_of_week..Date.today.end_of_week).map { |date| date.strftime('%-m/%-d (%A)') }

    #先月の日付と曜日
    # @last_dates = (Date.today.beginning_of_month.prev_month..Date.today.end_of_month.prev_month).map { |date| date.strftime('%-m/%-d (%A)') }

    #来月の日付と曜日
    # @next_dates = (Date.today.end_of_month.next_day..Date.today.end_of_month.next_month).map { |date| date.strftime('%-m/%-d (%A)')}
  end
end
