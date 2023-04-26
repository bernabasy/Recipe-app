Rails.application.routes.draw do
  devise_for :users
  # resources :users
  
  #   resources :recipes, except: [:update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  root "recipes#index"
end
