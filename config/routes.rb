Rails.application.routes.draw do
  resources :scores
  resources :predictions
  resources :week_results
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
