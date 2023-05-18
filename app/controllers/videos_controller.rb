class VideosController < ApplicationController
  before_action :require_login
  before_action :authenticate_admin
  before_action :set_dishes, only: [:new, :index]
  before_action :set_dish, only: [:search_videos]

  def new
    @dish = Dish.new
  end

  def search_videos
    Video.search_by_dish(@dish)
    binding.pry
    redirect_to videos_path
  end

  def index
    @videos = Video.includes(:dish).order('dishes.id ASC')
  end

  private

  def authenticate_admin
    redirect_to menus_path(date: Date.today), warning: "管理者権限を持っていません" unless current_user.admin?
  end

  def set_dishes
    @dishes = Dish.all
  end

  def set_dish
    @dish = Dish.find(params[:dish_id])
  end

end
