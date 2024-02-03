require 'rails_helper'

RSpec.feature 'Inventories Index Page', type: :feature do
  include Warden::Test::Helpers
  let(:user) { User.create(email: 'user@example.com', password: 'password') }
  let(:inventory1) { Inventory.create(name: 'Inventory 1', description: 'Description 1', user:) }
  let(:inventory2) { Inventory.create(name: 'Inventory 2', description: 'Description 2', user:) }
  let(:inventories) { [inventory1, inventory2] }

  before do
    login_as(user, scope: :user)
    visit inventories_path
  end

  scenario 'displays a "New Inventory" button' do
    expect(page).to have_link('New Inventory', href: new_inventory_path)
  end
end
