class FoodsController < ApplicationController

  def index
    @foods= Food.all
  end 
  def new
    if params.key?(:inventory_id)
      @inventory = Inventory.find(params[:inventory_id])
    else
      @recipe = Recipe.find(params[:recipe_id])
    end
    @food = Food.new
  end

  def create
    if params.key?(:inventory_id)
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

  def destroy
    if params.key?(:inventory_id)
      @inventory = Inventory.find(params[:inventory_id])
      @food = Food.find(params[:id])
      @inventory_food = InventoryFood.where(food: @food, inventory: @inventory)
      @inventory_food.delete_all
      @food.delete
      redirect_to @inventory, notice: 'Food was successfully destroyed.'

    else
      @recipe = Recipe.find(params[:recipe_id])
      @food = Food.find(params[:id])
      @recipe_food = RecipeFood.where(food: @food, recipe: @recipe)
      @recipe_food.delete_all
      @food.delete
      redirect_to @recipe, notice: 'Food was successfully destroyed.'

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
