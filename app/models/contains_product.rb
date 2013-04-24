class ContainsProduct < ActiveRecord::Base
  attr_accessible :preperation_method, :product_id

  belongs_to :recipe, class_name: "Recipe"
  belongs_to :product, class_name: "Product"

  validates :product_id, presence: true
  validates :recipe_id, presence: true

  def full_name
  	prod = Product.find(self.product_id).full_name
  end
end
