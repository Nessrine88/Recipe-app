Rails.application.routes.draw do
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'recipes#index'

  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes

  resources :recipes, except: [:update]
  resources :inventories, except: [:update] do
    resources :inventory_foods, only: [:index, :destroy]
    resources :foods, only: [:new, :create]
  end
end
