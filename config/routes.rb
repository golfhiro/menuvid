Rails.application.routes.draw do
  namespace :admin do
    resources :videos
    resources :users
    resources :menus
    resources :dishes

    root to: "videos#index"
    # get 'login', to: 'sessions#new'
    # post 'login', to: 'sessions#create'
    # delete 'logout', to: 'sessions#destroy'
    end

  root "tops#index"

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get 'menus/index'
  post 'menus/create_weekly_menu', to: 'menus#create_weekly_menu', as: 'menus_create_weekly_menu'

  resources :dishes do
    collection do
      get 'search_videos'
    end
  end
end
