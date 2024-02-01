class Food < ApplicationRecord
  belongs_to :inventory
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods
end
