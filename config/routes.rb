Rails.application.routes.draw do
  devise_for :users
  resources :errors
  root 'home#index'
  get 'home/help'

end
