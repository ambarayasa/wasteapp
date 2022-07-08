Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

   # API_Guard
   # https://github.com/Gokul595/api_guard#overriding-defaults
  api_guard_routes for: 'users', controller: { 
    registration: 'users/registration',
    authentication: 'users/authentication',
    # passwords: 'users/passwords',
    tokens: 'users/tokens'
  }

  resources :depots
  resources :categories
  resources :wastes
  resources :transactions

  resource :profile, only: [:show]
  namespace :balances do
    patch :add_balance
    patch :withdraw_balance
  end
end
