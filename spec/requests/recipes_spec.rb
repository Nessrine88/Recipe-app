# require 'rails_helper'
# require 'factory_bot_rails'

# RSpec.configure do |config|
#   config.include FactoryBot::Syntax::Methods
# end

# RSpec.describe RecipesController, type: :controller do
#   let(:user) { FactoryBot.create(:user) }
#   let(:recipe) { FactoryBot.create(:recipe, user: user) }

#   before do
#     sign_in user
#   end

#   describe 'GET #index' do
#     it 'returns http success' do
  
#       get '/recipes'
#       expect(response).to have_http_status(:success)
#     end

#     it 'renders the index template' do
#       get recipes_path
#       expect(response).to render_template(:index)
#     end
#   end

#   describe 'GET #show' do
#     it 'returns http success' do
#       @recipe = create(:recipe)
#       get recipe_path(@recipe)
#       expect(response).to have_http_status(:success)
#     end

#     it 'renders the show template' do
#       @recipe = create(:recipe)
#       get recipe_path(@recipe)
#       expect(response).to render_template(:show)
#     end
#   end
# end
