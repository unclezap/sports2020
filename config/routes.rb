Rails.application.routes.draw do
  resources :batches
  resources :articles
  resources :users, only: [:create]
  post '/auth', to: "auth#create"
  get '/current_user', to: 'auth#show'
end
