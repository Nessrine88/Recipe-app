require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe InventoryFood, type: :model do
  describe 'validations' do
    subject { described_class.new }
    it 'is not valid without a quantity' do
        expect(subject).to_not be_valid
      end
      it 'is not valid without a non-negative quantity' do
        subject.quantity = -5
        expect(subject).to_not be_valid
      end  
  end
end