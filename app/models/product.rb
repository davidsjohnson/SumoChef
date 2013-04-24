class Product < ActiveRecord::Base
  attr_accessible :description, :manufacturer_id, :product_name, :quantity, :unit_of_measure
  belongs_to :contains_product, class_name: "ContainsProduct"
  has_many :to_buys, dependent: :destroy


  validates :description, presence: true
  validates :product_name, presence: true, length: { maximum: 50}

  def full_name
   "#{Manufacturer.find(self.manufacturer_id).manufacturer_name} | #{product_name} | #{quantity} | #{unit_of_measure}"
  end
end
