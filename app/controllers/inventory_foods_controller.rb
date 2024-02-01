class InventoryFoodsController < ApplicationController
	before_action :set_inventory

	def index
    @inventory_foods = @inventory.inventory_foods
		@foods = @inventory.foods
  end

	private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end
end
