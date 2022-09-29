Rails.application.routes.draw do
  devise_for :users
  resources :payments
  resources :categories
  resources :users
  
  Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  Defines the root path route ("/")
  unauthenticated :users  do
    root 'users#index'
  end

  authenticated :users do
    root 'categories#index'
    
  end
end