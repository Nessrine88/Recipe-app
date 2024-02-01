class FoodsController < ApplicationController
  before_action :set_inventory, only: [:create]

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @food = Food.new
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @food = @inventory.foods.new(food_params)
  
    respond_to do |format|
      if @food.save
        format.html { redirect_to @inventory, notice: 'Food was successfully added to the inventory.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def food_params
    # Define the permitted parameters for creating a food item
    params.require(:food).permit(:name, :other_attributes)
  end
end