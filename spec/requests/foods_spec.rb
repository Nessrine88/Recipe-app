# spec/controllers/foods_controller_spec.rb

require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Recipe, type: :model do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_attributes) { attributes_for(:food) }

      it 'creates a new food' do
        expect do
          post :create, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the created food' do
        post :create, params: { food: valid_attributes }
        expect(response).to redirect_to(Food.last)
      end
    end
  end
end
