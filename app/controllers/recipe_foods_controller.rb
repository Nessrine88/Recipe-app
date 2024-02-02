class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:id])
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)
  
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient added successfully.'
    else
      flash[:alert] = @recipe_food.errors.full_messages.join(", ")
      render :new
    end
  end
  

  private

  def set_recipe
    @recipes = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id,:price, :quantity)
  end
end
