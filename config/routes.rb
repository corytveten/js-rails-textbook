Rails.application.routes.draw do

  resources :users

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  
  get '/auth/github/callback', to: 'sessions#create'

  resources :schools do
    resources :courses
  end
  
  resources :courses do
    resources :textbooks
  end

  resources :textbooks  
end
