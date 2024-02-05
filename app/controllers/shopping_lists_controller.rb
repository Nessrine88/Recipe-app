class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    load_recipe_and_inventory

    if @recipe && @inventory
      recipe_food_items = @recipe.recipe_foods
      inventory_food_items = @inventory.inventory_foods

      @missing_food_items = calculate_missing_food_items(recipe_food_items, inventory_food_items)
      calculate_totals

    else
      flash[:error] = 'Recipe or inventory not found.'
      redirect_to root_path
    end
  end

  def default
    load_user_data
    calculate_totals
  end

  private

  def load_recipe_and_inventory
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
  end

  def load_user_data
    @recipes = current_user.recipes
    @recipes_food = @recipes.flat_map(&:recipe_foods)
    @inventories = current_user.inventories
    @inventories_food = @inventories.flat_map(&:inventory_foods)
    @missing_food_items = @recipes_food - @inventories_food
  end

  def calculate_missing_food_items(recipe_food_items, inventory_food_items)
    missing_items = []

    recipe_food_items.each do |item|
      inventory_item = inventory_food_items.find { |inv_item| inv_item.food == item.food }

      if inventory_item
        if inventory_item.quantity < item.quantity
          missing_quantity = item.quantity - inventory_item.quantity
          missing_item = item.dup
          missing_item.quantity = missing_quantity
          missing_items << missing_item
        end
      else
        missing_items << item.dup
      end
    end

    missing_items
  end

  def calculate_totals
    @total_food_items = @missing_food_items.sum(&:quantity)
    @total_price = @missing_food_items.sum { |item| item.quantity * item.food.price }
  end
end
