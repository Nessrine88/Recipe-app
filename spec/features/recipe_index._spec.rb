require 'rails_helper'
require 'factory_bot_rails'

RSpec.feature "Recipes", type: :feature do
  include Warden::Test::Helpers
  let!(:user) { User.create(email: "user@example.com", password: "password") }
  let!(:recipes) { Recipe.create(name: 'Recipe 1', preparation_time: '2', cooking_time: '2', description: 'some description', public: true, user: user) }

  before do
    login_as(user, scope: :user)
    visit recipes_path
  end

  scenario "the user sees the correct recipes" do
    expect(page).to have_content('My Recipes')
    expect(page).to have_content(recipes.description)
  end

  scenario "the user sees a delete button for each recipe" do
    expect(page).to have_button("Delete")
  end

  scenario "the user sees a link to create a new recipe" do
    expect(page).to have_link("Create a new recipe")
  end

  context "when the user has no recipes" do
    let!(:recipes) { [] }

    scenario "the user sees a message indicating that there are no recipes" do
      expect(page).to have_content("No recipes yet.")
    end

    scenario "the user sees a link to create a new recipe" do
      expect(page).to have_link("Create a new recipe")
    end
  end
end
