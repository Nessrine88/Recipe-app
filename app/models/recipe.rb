class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :public, inclusion: { in: [true, false] }
  validates :user, presence: true

  def calculate_total_amount
    total_amount = 0
    recipe_foods.each do |recipe_food|
      total_amount += recipe_food.food.price * recipe_food.quantity
    end
    total_amount
  end
end
