class ToBuy < ActiveRecord::Base
  attr_accessible :product_id, :shopping_list_id
  belongs_to :shopping_list
  belongs_to :product

end
