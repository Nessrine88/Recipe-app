require 'rails_helper'

RSpec.feature 'Recipe Show Page', type: :feature do
  include Warden::Test::Helpers
  let!(:user) { User.create(email: 'user@example.com', password: 'password', confirmed_at: Time.now) }
  let!(:recipe) do
    Recipe.create(name: 'Recipe 1', preparation_time: '2', cooking_time: '2', description: 'some description',
                  public: true, user:)
  end
  let!(:inventory) { Inventory.create(name: 'Inventory 1', user:) }

  before do
    login_as(user, scope: :user)
    visit recipe_path(recipe)
  end

  scenario 'displays recipe details' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation time: #{recipe.preparation_time}")
    expect(page).to have_content("Cooking time: #{recipe.cooking_time}")
  end

  scenario 'displays recipe foods' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Value')
  end
end
