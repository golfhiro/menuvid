Rails.application.routes.draw do
  namespace :admin do
    resources :videos
    resources :users
    resources :menus
    resources :dishes

    root to: "users#index"
    end

  root "tops#index"

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/guest_login', to: 'sessions#guest_login'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauths/oauth', to: 'oauths#oauth', as: :auth_at_provider

  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :menus, only: %i[index edit update] do
    collection do
      get "last_week"
      get "two_weeks_ago"
      get "three_weeks_ago"
    end
  end
  post 'menus/create_weekly_menu', to: 'menus#create_weekly_menu', as: 'create_weekly_menu'

  resources :videos do
    get 'search_videos', on: :collection
  end

  resources :dishes, only: %i[index edit update]

  resource :profile, only: %i[show edit update]
end
