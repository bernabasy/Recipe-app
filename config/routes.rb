Rails.application.routes.draw do
  
  resources :foods, only: [:index, :new, :create, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
