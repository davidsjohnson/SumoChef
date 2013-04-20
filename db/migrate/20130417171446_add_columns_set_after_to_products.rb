class AddColumnsSetAfterToProducts < ActiveRecord::Migration
  def change
    add_column :products, :unit_of_measure, :string, after: :manufacturer_id
    add_column :products, :quantity, :integer, after: :unit_of_measure
  end
end
