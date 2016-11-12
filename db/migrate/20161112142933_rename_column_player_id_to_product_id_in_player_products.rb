class RenameColumnPlayerIdToProductIdInPlayerProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :player_products, :player_id, :product_id
  end
end
