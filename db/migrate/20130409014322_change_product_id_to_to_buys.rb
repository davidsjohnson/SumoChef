class ChangeProductIdToToBuys < ActiveRecord::Migration
  def up
  	remove_column :to_buys, :product_id
  	add_column :to_buys, :product_id, :integer
  end

  def down
  end
end
