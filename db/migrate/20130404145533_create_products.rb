class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :manufacturer_id
      t.string :description

      t.timestamps
    end

  end
end
