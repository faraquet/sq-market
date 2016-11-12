class AddSellerAndBuyerToDeals < ActiveRecord::Migration[5.0]
  def change
    remove_column :deals, :seller_id
    remove_column :deals, :buyer_id

    add_reference :deals, :buyer, index: true
    add_reference :deals, :seller, index: true

    add_foreign_key :deals, :players, column: :seller_id
    add_foreign_key :deals, :players, column: :buyer_id
  end
end
