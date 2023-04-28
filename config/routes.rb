Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users
  # Defines the root path route ("/")
  root "pages#index"

  resources :users
  resources :foods, only: [:index, :new, :create, :destroy, :update] do
    delete ":id", to: "foods#destroy", on: :member
  end
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods
  end
  get '/shopping_list', to: 'shopping_list#index'
  # get 'shopping_list/index'
end
