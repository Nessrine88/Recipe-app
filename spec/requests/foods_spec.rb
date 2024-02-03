# # spec/controllers/foods_controller_spec.rb

# require 'rails_helper'

# RSpec.describe FoodsController, type: :controller do
#   let(:valid_attributes) {
#     { name: 'Example Food', measurement_unit: 'Unit', price: 10.99 }
#   }

#   describe 'GET #index' do
#     it 'returns a success response' do
#       get 'recipes/1/foods'
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET #new' do
#     context 'with inventory_id' do
#       let(:inventory) { create(:inventory) }

#       it 'assigns a new food as @food' do
#         get :new, params: { inventory_id: inventory.id }
#         expect(assigns(:food)).to be_a_new(Food)
#       end
#     end

#     context 'with recipe_id' do
#       let(:recipe) { create(:recipe) }

#       it 'assigns a new food as @food' do
#         get :new, params: { recipe_id: recipe.id }
#         expect(assigns(:food)).to be_a_new(Food)
#       end
#     end
#   end

#   describe 'POST #create' do
#     context 'with valid parameters' do
#       context 'with inventory_id' do
#         let(:inventory) { create(:inventory) }

#         it 'creates a new Food' do
#           expect {
#             post :create, params: { inventory_id: inventory.id, food: valid_attributes }
#           }.to change(Food, :count).by(1)
#         end

#         it 'redirects to the created food' do
#           post :create, params: { inventory_id: inventory.id, food: valid_attributes }
#           expect(response).to redirect_to(inventory_path(inventory))
#         end
#       end

#       context 'with recipe_id' do
#         let(:recipe) { create(:recipe) }

#         it 'creates a new Food' do
#           expect {
#             post :create, params: { recipe_id: recipe.id, food: valid_attributes }
#           }.to change(Food, :count).by(1)
#         end

#         it 'redirects to the created food' do
#           post :create, params: { recipe_id: recipe.id, food: valid_attributes }
#           expect(response).to redirect_to(recipe_path(recipe))
#         end
#       end
#     end
#   end

#   describe 'DELETE #destroy' do
#     context 'with inventory_id' do
#       let(:inventory) { create(:inventory) }
#       let(:food) { create(:food) }

#       before do
#         inventory_food = create(:inventory_food, inventory: inventory, food: food)
#       end

#       it 'destroys the requested food' do
#         expect {
#           delete :destroy, params: { inventory_id: inventory.id, id: food.id }
#         }.to change(Food, :count).by(-1)
#       end

#       it 'redirects to the inventory' do
#         delete :destroy, params: { inventory_id: inventory.id, id: food.id }
#         expect(response).to redirect_to(inventory_path(inventory))
#       end
#     end

#     context 'with recipe_id' do
#       let(:recipe) { create(:recipe) }
#       let(:food) { create(:food) }

#       before do
#         recipe_food = create(:recipe_food, recipe: recipe, food: food)
#       end

#       it 'destroys the requested food' do
#         expect {
#           delete :destroy, params: { recipe_id: recipe.id, id: food.id }
#         }.to change(Food, :count).by(-1)
#       end

#       it 'redirects to the recipe' do
#         delete :destroy, params: { recipe_id: recipe.id, id: food.id }
#         expect(response).to redirect_to(recipe_path(recipe))
#       end
#     end
#   end
# end
