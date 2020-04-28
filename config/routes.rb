Rails.application.routes.draw do
  resources :batches
  resources :articles
  resources :users, only: [:create]
  post '/auth', to: "auth#create"
end
