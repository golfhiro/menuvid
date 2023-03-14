Rails.application.routes.draw do
  namespace :admin do
      resources :videos
      resources :users
      resources :dishes

      root to: "videos#index"
    end
  root "tops#index"

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
