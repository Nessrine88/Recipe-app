class RemoveInventoryIdFromFoods < ActiveRecord::Migration[7.1]
  def change
    remove_column :foods, :inventory_id, :bigint
  end
end
