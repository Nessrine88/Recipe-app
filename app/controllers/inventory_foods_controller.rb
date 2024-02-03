class InventoryFoodsController < ApplicationController
  before_action :set_inventory, only: [:destroy]
  before_action :set_inventory_food, only: [:destroy]

  def index
    @inventory_foods = InventoryFood.includes(:food).where(inventory_id: @inventory.id)
  end

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.new
    @foods = Food.all
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @food = Food.find(params[:inventory_food][:food_id])
    @inventory_food = @inventory.inventory_foods.new(food: @food, inventory: @inventory,
                                                     quantity: params[:inventory_food][:quantity])
    if @inventory_food.save
      redirect_to @inventory
    else
      render :new, status: :unprocessable_entity
    end
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