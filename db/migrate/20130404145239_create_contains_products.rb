class CreateContainsProducts < ActiveRecord::Migration
  def change
    create_table :contains_products do |t|
      t.integer :recipe_id
      t.integer :product_id
      t.string :unit_of_measure
      t.decimal :quantity
      t.string :preperation_method

      t.timestamps
    end

    add_index :contains_products, :recipe_id
    add_index :contains_products, :product_id
    add_index :contains_products, [:recipe_id, :product_id], unique: true
  end
end
