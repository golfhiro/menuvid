class MenusController < ApplicationController
  before_action :require_login

  def index
    return unless params[:date].present?

    start_date = params[:date].to_date.beginning_of_week
    end_date = start_date.end_of_week
    @week_menus = current_user.menus.where(date: start_date..end_date).order(date: :asc)

    if @week_menus.empty?
      create_weekly_menu(start_date)
      flash[:notice] = "#{start_date} から #{end_date} までの献立を作成しました！"
      redirect_to action: :index, date: params[:date]
    end
  end

  def create_weekly_menu(start_date)
    (start_date..start_date.end_of_week).each do |date|
      create_menu_for_date(date)
    end
  end

  def create_menu_for_date(date)
    return if current_user.menus.exists?(date: date)

    dish = Dish.order("RANDOM()").first
    current_user.menus.create(date: date, dish: dish)
  end

  def edit
    @menu = current_user.menus.find(params[:id])
    @dishes = Dish.all
  end

  def update
    @menu = current_user.menus.find(params[:id])
    @menu.update(dish_id: params[:menu][:dish_id])
    redirect_to menus_path(date: @menu.date)
  end
end
