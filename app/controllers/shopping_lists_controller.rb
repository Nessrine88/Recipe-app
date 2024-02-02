# app/controllers/shopping_lists_controller.rb
class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    set_recipe_and_inventory
    generate_shopping_list
  end

  private

  def set_recipe_and_inventory
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
  end

  def generate_shopping_list
    return unless @recipe && @inventory

    recipe_food_items = @recipe.recipe_foods
    inventory_food_items = @inventory.inventory_foods

    @missing_food_items = find_missing_food_items(recipe_food_items, inventory_food_items)

    calculate_totals
  end

  def find_missing_food_items(recipe_food_items, inventory_food_items)
    @missing_food_items = []

    recipe_food_items.each do |item|
      inventory_item = inventory_food_items.find { |inv_item| inv_item.food == item.food }

      if inventory_item
        if inventory_item.quantity < item.quantity
          missing_quantity = item.quantity - inventory_item.quantity
          missing_item = item.dup
          missing_item.quantity = missing_quantity
          @missing_food_items << missing_item
        end
      else
        puts "There's no missing food  "
      end
    end
  end

  def calculate_totals
    @total_food_items = @missing_food_items.sum(&:quantity)
    @total_price = @missing_food_items.sum { |item| item.quantity * item.food.price }
  end

  
end
