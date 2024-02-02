class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory, only: %i[show edit destroy]
  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1 or /inventories/1.json
  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.inventory_foods.includes(:food)
    render 'inventory_foods/index', locals: { inventory: @inventory }
  end

  # GET /inventories/new
  def new
    @inventory = current_user.inventories.build
  end

  # GET /inventories/1/edit
  def edit; end

  # POST /inventories or /inventories.json
  def create
    @inventory = current_user.inventories.build(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory) }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    inventory = Inventory.find(params[:id])
    inventory.inventory_foods.destroy_all
    inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name, :description, :reference, :user_id)
  end
end
