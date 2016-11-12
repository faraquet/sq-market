class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.integer :player_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
