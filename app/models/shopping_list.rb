class ShoppingList < ActiveRecord::Base
  attr_accessible :description, :state
  belongs_to :user
  has_many :to_buys, foreign_key: "shopping_list_id", dependent: :destroy
  has_many :products, through: :to_buys, source: :product

  before_save { state.downcase! }


  validates :description, presence: true
  validates :state, presence: true
  validates :user_id, presence: true

  def add_product!(product)
  	to_buys.create!(product_id: product.id)
  end

  def remove_product!(product)
    to_buys.find_by_product_id(product.id).destroy
  end
end
