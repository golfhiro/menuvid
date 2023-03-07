Rails.application.routes.draw do
  resources :users
  root "tops#index"
end
