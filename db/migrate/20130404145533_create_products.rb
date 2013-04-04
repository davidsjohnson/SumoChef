class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :product_name
      t.integer :manufacturer_id
      t.string :description

      t.timestamps
    end

    add_index :products, :product_id
  end
end
