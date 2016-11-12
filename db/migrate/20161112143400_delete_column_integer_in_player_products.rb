class DeleteColumnIntegerInPlayerProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :player_products, :integer
  end
end
