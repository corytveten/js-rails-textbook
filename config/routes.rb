Rails.application.routes.draw do

  resources :schools do
    resources :courses
  end
  
  resources :courses do
    resources :textbooks
  end

  resources :textbooks  
end
