Rails.application.routes.draw do
  root "articles#index"
  resources :articles
  get "login", to: "sessions#new"
  # resources :categories
  get "/categories/:id", to: 'articles#index', as: "category"
end
