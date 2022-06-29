Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resource :user, only: [:create]

  resources :depots
  resources :categories
  resources :wastes

  resource :profile, only: [:show]
end
