class ChangeDescriptionToTextRecipes < ActiveRecord::Migration
  def up
  	change_column :recipes, :directions, :text
  end

  def down
  end
end
