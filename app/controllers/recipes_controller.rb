class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def show
    # @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created'
    else
      render :new
    end
  end

  def edit

  end

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
