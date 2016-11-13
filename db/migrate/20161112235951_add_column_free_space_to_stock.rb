class AddColumnFreeSpaceToStock < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :free_space, :integer
  end
end
