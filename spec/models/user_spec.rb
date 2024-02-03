# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) do
    {
      name: 'Test User',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  it 'is valid with valid attributes' do
    user = User.new(valid_attributes)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(valid_attributes.except(:email))
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(valid_attributes.except(:password))
    expect(user).to_not be_valid
  end

  it 'is not valid with a mismatched password and password confirmation' do
    user = User.new(valid_attributes.merge(password_confirmation: 'different_password'))
    expect(user).to_not be_valid
  end

  it 'is not valid with a short password' do
    user = User.new(valid_attributes.merge(password: 'short', password_confirmation: 'short'))
    expect(user).to_not be_valid
  end

  it 'associates with inventories' do
    user = User.new(valid_attributes)
    expect(user.inventories).to be_empty
  end

  it 'associates with recipes' do
    user = User.new(valid_attributes)
    expect(user.recipes).to be_empty
  end
end