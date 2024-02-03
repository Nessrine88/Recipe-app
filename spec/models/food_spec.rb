# spec/models/food_spec.rb

require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(id: 1, name: 'nessrine', price: 35, measurement_unit: 'kg') }
  before { subject.save }

  describe 'validations' do
    it 'validates presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'validates presence of measurement_unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'validates presence of price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'validates numericality of price' do
      subject.price = -5
      expect(subject).to_not be_valid
    end
  end
end
