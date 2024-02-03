# spec/features/public_recipes_spec.rb

require 'rails_helper'

RSpec.feature 'Public Recipes Page', type: :feature do
  let(:user) { User.create(email: 'user@example.com', password: 'password', name: 'John Doe') }
  let(:public_recipes) do
    [
      Recipe.create(name: 'Recipe 1', description: 'Description 1', public: true, user:),
      Recipe.create(name: 'Recipe 2', description: 'Description 2', public: true, user:)
    ]
  end

  before do
    login_as(user, scope: :user)
    public_recipes
    visit public_recipes_path
  end

  scenario 'displays a list of public recipes' do
    visit public_recipes_path
    expect(page).to have_content('Public Recipes')
  end
end
