Rails.application.routes.draw do
  root "tops#index"
  get 'terms', to: 'tops#terms'
  get 'privacy', to: 'tops#privacy'

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

  resources :menus, only: %i[index edit update]

  resources :videos do
    get 'search_videos', on: :collection
  end

  resources :dishes, only: %i[index edit update]

  resource :profile, only: %i[show edit update]
end
