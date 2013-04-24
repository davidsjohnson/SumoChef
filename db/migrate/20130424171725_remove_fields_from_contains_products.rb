class RemoveFieldsFromContainsProducts < ActiveRecord::Migration
  def up
    remove_column :contains_products, :quantity
    remove_column :contains_products, :unit_of_measure
  end

  def down
    add_column :contains_products, :unit_of_measure, :string
    add_column :contains_products, :quantity, :integer
  end
end
