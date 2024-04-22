Rails.application.routes.draw do
  devise_for :users
  #makes http://localhost:3000 open to index.html.erb
  root "articles#index"

  get "/articles", to: "articles#index"
  #allows navigation between webpages
  get "/articles/index", to: "articles#index"
  get "/articles/accountCreation", to: "articles#accountCreation"
  get "/articles/database", to: "articles#database"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

