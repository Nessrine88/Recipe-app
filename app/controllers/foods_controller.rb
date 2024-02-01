class FoodsController < ApplicationController
  before_action :set_inventory
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def new
    @food = @inventory.foods.build
  end

  def create
    @food = @inventory.foods.build(food_params)
    if @food.save
      redirect_to inventory_path(@inventory), notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food.destroy
    redirect_to inventory_foods_path(@inventory), notice: 'Food was successfully deleted.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def set_food
    @food = @inventory.foods.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
