class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :phone

      t.timestamps
    end

    add_index :stores, :store_name
  end
end
