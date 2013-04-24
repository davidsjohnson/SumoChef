class Recipe < ActiveRecord::Base
  attr_accessible :product_ids, :contains_products, :description, :directions, :recipe_category, :recipe_id, :recipe_name, :servings, :total_cook_time, :total_prep_time
  belongs_to :user
  has_many :contains_products, foreign_key: "recipe_id", dependent: :destroy
  has_many :products, through: :contains_products, source: :product
  accepts_nested_attributes_for :contains_products, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  validates :user_id, presence: true
  validates :directions, presence: true
  validates :recipe_category, presence: true
  validates :recipe_name, presence: true, length: { maximum: 40}
  validates :description, length: { maximum: 100 }
  validates :total_cook_time, length: { maximum: 10 }
  validates :total_prep_time, length: { maximum: 10 }

  default_scope order: 'recipes.created_at DESC'

  def contains!(product)
    contains_products.create!(product_id: product.id)
  end

  def contains?(product)
    contains_products.find_by_product_id(product.id)
  end

  def delete_product(product)
    self.contains_products.find_by_product_id(product.id).destroy
  end

  class << self
    def search(searchword)
      if searchword
        Recipe.find(:all, :conditions => ['recipe_name ILIKE ?', "%#{searchword}%"])
      else
        Recipe.find(:all)
      end
    end
  end
end
