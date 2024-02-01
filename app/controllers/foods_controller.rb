class FoodsController < ApplicationController
  before_action :set_inventory, only: [:new, :create]

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @food = Food.new
  end

  def create
    @food = @inventory.foods.new(food_params)
    @food.inventory_id = params[:inventory_id]

    if @food.save
      inventory_food = @inventory.inventory_foods.create(food_id: @food.id, quantity: params[:food][:quantity])
      redirect_to @inventory, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
