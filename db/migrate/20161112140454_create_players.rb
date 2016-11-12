class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :uid
      t.string :name
      t.integer :level
      t.integer :experience
      t.decimal :balance

      t.timestamps
    end
  end
end
