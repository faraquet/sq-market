class AddColumnTotalToAd < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :total, :decimal
  end
end
