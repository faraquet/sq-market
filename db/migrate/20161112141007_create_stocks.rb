class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :player_id
      t.string :integer
      t.integer :volume

      t.timestamps
    end
  end
end
