class DishesController < ApplicationController
  before_action :require_login
  before_action :authenticate_admin

  def new
    @dish = Dish.new
    @dishes = Dish.all
  end

  def search_videos
    @dish = Dish.find(params[:dish_id])

    Video.search_by_dish(@dish)

    redirect_to action: 'index'
  end

  def index
    @dishes = Dish.all
    @videos = Video.includes(:dish).order('dishes.id ASC')
  end

  private

  def authenticate_admin
    redirect_to menus_path, warning: "管理者権限を持っていません" unless current_user.admin?
  end

end
