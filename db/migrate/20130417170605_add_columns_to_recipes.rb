class AddColumnsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :unit_of_measure, :string
    add_column :recipes, :quantity, :integer
  end
end
