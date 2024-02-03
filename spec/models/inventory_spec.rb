# spec/models/inventory_spec.rb

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }

  let(:valid_attributes) do
    {
      user: user,
      description: 'List of food items for inventory'
    }
  end

  it 'is valid with valid attributes' do
    inventory = Inventory.new(valid_attributes)
    expect(inventory).to be_valid
  end

  it 'is not valid without a description' do
    inventory = Inventory.new(valid_attributes.except(:description))
    expect { inventory.save }.to change { Inventory.count }.by(0)
    expect(inventory).to_not be_valid
  end

  it 'belongs to a user' do
    inventory = Inventory.new(valid_attributes)
    expect(inventory.user).to eq(user)
  end

  it 'has many inventory foods' do
    inventory = Inventory.new(valid_attributes)
    expect(inventory.inventory_foods).to be_empty
  end

  it 'has many foods through inventory foods' do
    inventory = Inventory.new(valid_attributes)
    expect(inventory.foods).to be_empty
  end
end
