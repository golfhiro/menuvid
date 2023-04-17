class DishesController < ApplicationController
  before_action :require_login
  before_action :authenticate_admin

  def index
    @dishes = Dish.all
  end

  def edit
    @dish = Dish.find(params[:id])
    @genre_tags = GenreTag.all
    @ingredient_tags = IngredientTag.all
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update(dish_params)
      redirect_to dishes_path
    else
      render :edit
    end
  end

  private

  def authenticate_admin
    redirect_to menus_path(date: Date.today), warning: "管理者権限を持っていません" unless current_user.admin?
  end

  def dish_params
    params.require(:dish).permit(:name, genre_tag_ids: [], ingredient_tag_ids: [])
  end
end
