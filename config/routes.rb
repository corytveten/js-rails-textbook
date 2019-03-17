Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users

  delete 'logout' => 'sessions#destroy'

  resources :schools do
    resources :courses
  end
  
  resources :courses do
    resources :textbooks
  end

  resources :textbooks  
end
