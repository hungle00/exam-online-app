Rails.application.routes.draw do
  get 'notifications/index'
  scope module: 'admin' do
    resources :categories, except: [:show]
    resources :exams, except: [:index, :show, :new] do
      resources :questions, except: [:index, :show, :new]
    end
    get 'dashboard/users'
    get 'dashboard/reports'
    get 'dashboard/stats'
  end

  resources :categories, only: [:show]
  resources :exams, only: [:index, :show] do
    get 'take', on: :member
  end
  
  resources :submissions, only: [:create, :show]
  resources :reports, only: [:create, :destroy]
  resources :notifications, only: [:index]
  
  root to: 'pages#home'
  get 'pages/home'
  #resources :profiles, only: [:show]
  get '/user/:id', to: 'user#show', as: 'profile'
  get '/user', to: 'user#index', as: 'top_users'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
