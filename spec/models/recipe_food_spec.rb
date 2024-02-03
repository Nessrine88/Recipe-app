# # spec/models/recipe_food_spec.rb

# require 'rails_helper'

# RSpec.describe RecipeFood, type: :model do
#   let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
#   let(:inventory) { Inventory.create(user:, description: 'List of food items for inventory') }
#   let(:food) { Food.create(name: 'Test Food', price: 10) }
#   let(:recipe) { Recipe.create(user:, name: 'Test Recipe') }

#   let(:valid_attributes) do
#     {
#       food: food,
#       recipe: recipe,
#       quantity: 5
#     }
#   end

#   it 'is valid with valid attributes' do
#     recipe_food = RecipeFood.new(valid_attributes)
#     expect(recipe_food).to be_valid
#   end

#   it 'is not valid without a food' do
#     recipe_food = RecipeFood.new(valid_attributes.except(:food))
#     expect { recipe_food.save }.to change { RecipeFood.count }.by(0)
#     expect(recipe_food).to_not be_valid
#   end

#   it 'is not valid without a recipe' do
#     recipe_food = RecipeFood.new(valid_attributes.except(:recipe))
#     expect { recipe_food.save }.to change { RecipeFood.count }.by(0)
#     expect(recipe_food).to_not be_valid
#   end

#   it 'belongs to a food' do
#     recipe_food = RecipeFood.new(valid_attributes)
#     expect(recipe_food.food).to eq(food)
#   end

#   it 'belongs to a recipe' do
#     recipe_food = RecipeFood.new(valid_attributes)
#     expect(recipe_food.recipe).to eq(recipe)
#   end
# end
