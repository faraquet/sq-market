class CreatePlayerProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :player_products do |t|
      t.string :player_id
      t.string :integer
      t.integer :stock_id
      t.integer :amount

      t.timestamps
    end
  end
end
