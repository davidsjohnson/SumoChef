class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :recipe_id
      t.string :recipe_name
      t.string :description
      t.string :directions
      t.string :total_prep_time
      t.string :total_cook_time
      t.integer :servings
      t.string :recipe_category
      t.integer :user_id

      t.timestamps
    end
    add_index :recipes, :recipe_name
    add_index :recipes, :user_id
    add_index :recipes, :created_at
  end
end
