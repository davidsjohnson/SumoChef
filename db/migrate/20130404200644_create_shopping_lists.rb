class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :description
      t.string :state

      t.timestamps
    end
  end
end
