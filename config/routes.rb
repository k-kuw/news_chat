Rails.application.routes.draw do
  root "articles#index"
  resources :articles
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "/categories/:id", to: 'articles#index', as: "category"
  get "users", to: "users#new"
  post "users", to: "users#create"
end
