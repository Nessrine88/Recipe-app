Rails.application.routes.draw do
 devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'recipes#index'

  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes

  resources :recipes, except: [:update] do
    resources :recipe_foods, only: [:new, :create]
    member do
      patch 'toggle', to: 'recipes#toggle_recipe'
    end
    resources :foods, only: [:index, :new, :create, :destroy]
  end
  resources :inventories, except: [:update] do
    resources :inventory_foods, only: [:index,:new,:create, :destroy]
    resources :foods, only: [:new, :create, :destroy]
  end

  get '/shopping_lists', to: 'shopping_lists#index', as: 'shopping_lists'
 
end
