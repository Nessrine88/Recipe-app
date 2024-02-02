# spec/models/recipe_spec.rb

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    subject { described_class.new }

    it 'is not valid without a name' do
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without a description' do
      expect(subject).to_not be_valid
      expect(subject.errors[:description]).to include("can't be blank")
    end

    it 'is not valid without a non-negative preparation time' do
      subject.preparation_time = -5
      expect(subject).to_not be_valid
      expect(subject.errors[:preparation_time]).to include('must be greater than or equal to 0')
    end

    it 'is not valid without a non-negative cooking time' do
      subject.cooking_time = -3
      expect(subject).to_not be_valid
      expect(subject.errors[:cooking_time]).to include('must be greater than or equal to 0')
    end
    it 'is not valid without a user' do
      expect(subject).to_not be_valid
      expect(subject.errors[:user]).to include("can't be blank")
    end
  end
end
