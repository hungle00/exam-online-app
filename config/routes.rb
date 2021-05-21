Rails.application.routes.draw do
  scope module: 'admin' do
    resources :categories, only: [:create, :update, :destroy]
    resources :exams, except: [:index, :show, :new] do
      resources :questions, except: [:index, :show, :new]
    end
    resources :users, only: [:index]
  end

  resources :categories, only: [:index, :show]
  resources :exams, only: [:index, :show] do
    get 'take', on: :member
  end
  resources :submissions, only: [:create]
  
  root to: 'pages#home'
  get 'pages/home'
  resources :profiles, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
