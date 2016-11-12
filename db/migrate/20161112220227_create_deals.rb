class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.integer :player_id
      t.integer :ad_id

      t.timestamps
    end
  end
end
