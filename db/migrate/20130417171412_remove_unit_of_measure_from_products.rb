class RemoveUnitOfMeasureFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :unit_of_measure
    remove_column :products, :quantity
  end

  def down
    add_column :products, :quantity, :integer
    add_column :products, :unit_of_measure, :string
  end
end
