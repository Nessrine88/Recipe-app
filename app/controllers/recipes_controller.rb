class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @inventories = Inventory.all
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

  def toggle_recipe
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: 'Recipe status toggled successfully.'
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.recipe_foods.destroy_all
    recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully deleted'
  end

  private

  def set_recipe
    @recipe = if params[:id] == 'public_recipes'
                # No need to find a recipe when displaying public recipes
                nil
              else
                # Find the recipe by its id
                current_user.recipes.find(params[:id])
              end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end