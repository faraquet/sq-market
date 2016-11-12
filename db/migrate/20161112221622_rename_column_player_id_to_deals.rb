class RenameColumnPlayerIdToDeals < ActiveRecord::Migration[5.0]
  def change
    rename_column :deals, :player_id, :seller_id
    rename_column :deals, :ad_id, :product_id
    add_column :deals, :buyer_id, :integer
    add_column :deals, :quantity, :integer
    add_column :deals, :price, :decimal
    add_column :deals, :total, :decimal
  end
end
