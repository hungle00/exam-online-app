Rails.application.routes.draw do
  resources :exams
  resources :categories
  root to: 'pages#home'
  get 'pages/home'
  resources :profiles, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
