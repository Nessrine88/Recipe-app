class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
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
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully deleted'
  end

  def shopping_list
    set_recipe_and_inventory
    @total = 0
    @diff = miss_food
  end

  def miss_food
    @food_recipe_array = @recipe.recipe_foods
    @food_inventory_array = @inventory.inventory_foods
    @food_id_inv = []
    @food_inventory_array.each do |f|
      @food_id_inv.push(f.food_id)
    end

    @diff_food = []
    @food_recipe_array.each do |food_recipe|
      if @food_id_inv.include?(food_recipe.food_id)

        idx = @food_id_inv.find_index(food_recipe.food_id)
        elt = @food_inventory_array[idx]
        quantit = food_recipe.quantity - elt.quantity
        @diff_food.push({ food_id: food_recipe.food_id, quantity: quantit })
      else
        @diff_food.push({ food_id: food_recipe.food_id, quantity: food_recipe.quantity })
      end
    end
  end

  private

  def set_recipe_and_inventory
    @recipe = Recipe.find(params[:format])
    @inventory = Inventory.find(params[:recipe][:inventory_id])
  end

  
  

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
