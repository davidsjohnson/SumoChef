class CreateToBuys < ActiveRecord::Migration
  def change
    create_table :to_buys do |t|
      t.integer :shopping_list_id
      t.string :product_id

      t.timestamps
    end

    add_index :to_buys, :shopping_list_id
    add_index :to_buys, :product_id
    add_index :to_buys, [:shopping_list_id, :product_id]
  end
end
