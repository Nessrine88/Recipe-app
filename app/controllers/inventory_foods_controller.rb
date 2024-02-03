# app/controllers/inventory_foods_controller.rb
class InventoryFoodsController < ApplicationController
  def index
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_foods = @inventory.inventory_foods
  end

  def new
    @inventory_food = @inventory.inventory_foods.new
  end

  def create
    @inventory_food = @inventory.inventory_foods.new(inventory_food_params)

    if @inventory_food.save
      redirect_to inventory_foods_path, notice: 'Inventory food was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @inventory_food.update(inventory_food_params)
      redirect_to inventory_foods_path, notice: 'Inventory food was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @inventory_food.destroy
    redirect_to inventory_foods_path, notice: 'Inventory food was successfully deleted.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def set_inventory_food
    @inventory_food = @inventory.inventory_foods.find(params[:id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity)
  end
end
