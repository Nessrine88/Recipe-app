class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods

  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
end
