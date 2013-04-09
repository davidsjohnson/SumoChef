class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :manufacturer_name

      t.timestamps
    end

    add_index :manufacturers, :manufacturer_name
  end
end
