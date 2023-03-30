class MenusController < ApplicationController

  def index
    @menus = current_user.menus.where(date: Date.today.beginning_of_week..Date.today.end_of_week).includes(:dish).order(date: :asc)
  end

  def create_weekly_menu
    # 今週の日付を取得
    dates = (Date.today.beginning_of_week..Date.today.end_of_week).map { |date| date.strftime('%-m/%-d (%a)') }

    # 1週間分の献立を作成する
    dates.each do |date|
      # すでに同じ日付が登録されているかどうかを確認する
      if current_user.menus.exists?(date: Date.parse(date))
        next # 登録済みの場合はスキップする
      end

      # ランダムに1つの料理名を取得する
      dish = Dish.order(Arel.sql('RANDOM()')).first

      # 献立を保存する
      menu = current_user.menus.build(
        date: Date.parse(date),
        dish: dish,
      )
      menu.save
    end

    redirect_to menus_path
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
