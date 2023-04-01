class MenusController < ApplicationController
  def index
    @menus = current_user.menus.this_week
  end

  def create_weekly_menu
  # 今週の日付を取得
    dates = (Date.today.beginning_of_week..Date.today.end_of_week)

    # 1週間分の献立を作成する
    dates.each do |date|
      create_menu_for_date(date)
    end

    redirect_to menus_path
  end

  def create_menu_for_date(date)
    # すでに同じ日付が登録されているかどうかを確認する
    return if current_user.menus.exists?(date: date)

    # ランダムに1つの料理名を取得する
    dish = Dish.order(Arel.sql('RANDOM()')).first

    # 献立を保存する
    menu = current_user.menus.build(
      date: date,
      dish: dish,
    )
    menu.save
  end

  def edit
    @menu = current_user.menus.find(params[:id])
    @dishes = Dish.all
  end

  def update
    @menu = current_user.menus.find(params[:id])
    @menu.update(dish_id: params[:menu][:dish_id])
    redirect_to menus_path
  end
end
