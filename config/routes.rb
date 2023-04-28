Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users
  # Defines the root path route ("/")
  root "pages#index"

  resources :users
  resources :foods, only: [:index, :new, :create, :destroy] do
    delete ":id", to: "foods#destroy", on: :member
  end
  resources :recipes
  get "public_recipes", to: "public_recipes#index"
end
