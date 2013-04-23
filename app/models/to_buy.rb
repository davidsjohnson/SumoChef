class ToBuy < ActiveRecord::Base
  attr_accessible :product_id, :shopping_list_id
  belongs_to :shopping_list
  belongs_to :product

  def product_name
  	Product.find_by_id(self.product_id).full_name
  end
end
