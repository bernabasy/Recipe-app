Rails.application.routes.draw do
  
  resources :foods, only: [:index, :new, :create, :destroy] do
    delete ":id", to: "foods#destroy", on: :member
  end

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  # root "recipes#index"
end
