Rails.application.routes.draw do
  get 'password/reset'
  post 'password/forgot'
  get 'password/forgot'
  post 'password/reset'
  resources :users
  post 'home/login'
  get 'home/login'
  get 'new/create'
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
