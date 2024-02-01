class FoodsController < ApplicationController
  def new
    if params.has_key?(:inventory_id)
      @inventory = Inventory.find(params[:inventory_id])
    else
      @recipe = Recipe.find(params[:recipe_id])
    end
    @food = Food.new
  end

  def create
    if params.has_key?(:inventory_id)
      @inventory = Inventory.find(params[:inventory_id])
      @food = @inventory.foods.new(food_params)

      if @food.save
        @inventory.inventory_foods.create(food_id: @food.id, quantity: params[:food][:quantity])
        redirect_to @inventory, notice: 'Food was successfully created.'
      else
        render :new
      end
    else
      @recipe = Recipe.find(params[:recipe_id])
      @food = @recipe.foods.new(food_params)

      if @food.save
        @recipe.recipe_foods.create(food: @food, quantity: params[:food][:quantity])
        redirect_to @recipe, notice: 'Food was successfully created.'
      else
        render :new
      end
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
