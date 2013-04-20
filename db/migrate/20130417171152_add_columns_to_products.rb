class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :unit_of_measure, :string
    add_column :products, :quantity, :integer
  end
end
