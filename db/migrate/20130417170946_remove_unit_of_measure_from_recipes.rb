class RemoveUnitOfMeasureFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :unit_of_measure
    remove_column :recipes, :quantity
  end

  def down
    add_column :recipes, :quantity, :integer
    add_column :recipes, :unit_of_measure, :string
  end
end
