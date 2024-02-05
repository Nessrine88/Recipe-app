require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Food, type: :model do
  describe 'validations' do
    subject { described_class.new }

    it 'is not valid without a name' do
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without a measurement_unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a non-negative price' do
      subject.price = -5
      expect(subject).to_not be_valid
      expect(subject.errors[:price]).to include('must be greater than or equal to 0')
    end

    it 'is not valid without a price' do
      subject.price = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:price]).to include("can't be blank")
    end

    it 'is not valid without a duplicated name' do
      recipe1 = FactoryBot.create(:recipe, name: 'Unique Recipe')
      recipe2 = FactoryBot.build(:recipe, name: 'Unique Recipe')
      expect(recipe2).not_to be_valid
    end
  end
end
