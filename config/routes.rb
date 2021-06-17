Rails.application.routes.draw do
  get 'notifications/index'
  scope module: 'admin' do
    resources :categories, except: [:show]
    resources :exams, except: [:index, :show] do
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
  resources :notifications, only: [:index, :update]
  
  root to: 'pages#home'
  get 'pages/home'
  resources :profiles, only: [:show]
  #get '/user/:id', to: 'user#show', as: 'profile'
  get '/top_score', to: 'top_score#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
