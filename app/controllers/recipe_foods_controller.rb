class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find(params[:recipe_food][:food_id])
    @recipe_food = @recipe.recipe_foods.new(food: @food, recipe: @recipe,
                                            quantity: params[:recipe_food][:quantity])
    if @recipe_food.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.delete
    redirect_to @recipe
  end
end
