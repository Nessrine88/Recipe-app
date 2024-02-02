class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def calculate_total_amount
    total_amount = 0
    recipe_foods.each do |recipe_food|
      total_amount += recipe_food.food.price * recipe_food.quantity
    end
    total_amount
  end
end
