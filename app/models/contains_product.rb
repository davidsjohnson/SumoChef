class ContainsProduct < ActiveRecord::Base
  attr_accessible :preperation_method, :product_id, :quantity, :unit_of_measure

  belongs_to :recipe, class_name: "Recipe"
  belongs_to :product, class_name: "Product"

  validates :product_id, presence: true
  validates :recipe_id, presence: true
  validates :quantity, presence: true
  validates :unit_of_measure, presence: true
end
