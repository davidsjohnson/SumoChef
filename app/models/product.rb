class Product < ActiveRecord::Base
  attr_accessible :description, :manufacturer_id, :product_id, :product_name

  belongs_to :contains_product, class_name: "ContainsProduct"
end
