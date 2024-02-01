class InventoryFoodsController < ApplicationController
  before_action :set_inventory, only: [:destroy]
  before_action :set_inventory_food, only: [:destroy]

  def index
    @inventory_foods = InventoryFood.where(inventory_id: @inventory.id)
  end

  def destroy
    @inventory_food.destroy
    redirect_to inventories_path, notice: 'Inventory food was successfully deleted.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def set_inventory_food
    @inventory_food = @inventory.inventory_foods.find(params[:id])
  end
end
