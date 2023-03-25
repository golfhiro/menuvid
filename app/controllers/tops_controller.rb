class TopsController < ApplicationController
  skip_before_action :require_login

  def index
    @videos =  Video.order('RANDOM()').limit(7)

    @dates = (Date.today.beginning_of_week..Date.today.end_of_week).map { |date| date.strftime('%-m/%-d (%A)') }
  end
end
