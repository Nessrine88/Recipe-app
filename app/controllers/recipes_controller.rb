class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show edit destroy]

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
      redirect_to recipes_url, notice: 'Recipe was successfully created'
    else
      render :new
    end
  end

  def edit; end

  def public_recipes
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    render 'public_recipes'
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully deleted'
  end

  private

  def set_recipe
    if params[:id] == "public_recipes"
      # No need to find a recipe when displaying public recipes
      @recipe = nil
    else
      # Find the recipe by its id
      @recipe = current_user.recipes.find(params[:id])
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
