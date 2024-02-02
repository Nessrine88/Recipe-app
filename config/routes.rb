Rails.application.routes.draw do
  get 'shopping_lists/index'
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'recipes#index'

  resources :recipes, except: [:update]
  resources :inventories, except: [:update] do
    resources :inventory_foods, only: [:index, :destroy]
    resources :foods, only: [:new, :create]
  end

  get '/shopping_lists', to: 'shopping_lists#index', as: 'shopping_lists'
  get '/shopping_lists/default', to: 'shopping_lists#default', as: :default_shopping_lists
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
end
