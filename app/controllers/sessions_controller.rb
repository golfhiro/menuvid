class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :guest_login]

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to menus_path(date: Date.today), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, success: t('.success')
  end

  def guest_login
    @guest_user = User.find_by(email: 'guest@example.com')
    unless @guest_user
      @guest_user = User.create(
        name: 'ゲスト',
        email: 'guest@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
    auto_login(@guest_user)
    redirect_to menus_path(date: Date.today), success: 'ゲストとしてログインしました'
  end
end
