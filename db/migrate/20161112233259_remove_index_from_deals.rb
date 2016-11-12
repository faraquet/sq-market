class RemoveIndexFromDeals < ActiveRecord::Migration[5.0]
  def change
    remove_index :deals, :seller_id
    remove_index :deals, :buyer_id
  end
end
