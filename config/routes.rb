Rails.application.routes.draw do
  resources :transaction_items
  resources :transaction_headers
  resources :categories
  resources :groups
  resources :suppliers
  resources :account_users
  resources :accounts
  resources :welcomes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcomes#index'
end
