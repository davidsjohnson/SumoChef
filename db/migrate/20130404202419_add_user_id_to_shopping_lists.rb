class AddUserIdToShoppingLists < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :user_id, :integer
    add_index :shopping_lists, :user_id
    add_index :shopping_lists, [:id, :user_id]
  end
end
