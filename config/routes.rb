Rails.application.routes.draw do
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'recipes#index'

  resources :recipes, except: [:update]
  resources :inventories, except: [:update] do
    resources :inventory_foods, only: [:index, :new, :create]
  end
end
