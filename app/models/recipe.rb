class Recipe < ActiveRecord::Base
  attr_accessible :product_ids, :contains_products, :description, :directions, :recipe_category, :recipe_id, :recipe_name, :servings, :total_cook_time, :total_prep_time
  belongs_to :user
  has_many :contains_products, foreign_key: "recipe_id", dependent: :destroy
  has_many :products, through: :contains_products, source: :product

  validates :user_id, presence: true
  validates :directions, presence: true
  validates :recipe_category, presence: true
  validates :recipe_name, presence: true, length: { maximum: 40}
  validates :description, length: { maximum: 100 }
  validates :total_cook_time, length: { maximum: 10 }
  validates :total_prep_time, length: { maximum: 10 }

  default_scope order: 'recipes.created_at DESC'

  def contains!(product, quantity, unit_of_measure)
    contains_products.create!(product_id: product.id, quantity: quantity, unit_of_measure: unit_of_measure)
  end

  def contains?(product)
    contains_products.find_by_product_id(product.id)
  end

  def owns_recipe?
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @user.id = @recipe.user.id
  end

  # def product_ids
  #   ids.each do |id|
  #     p = Product.find(id)
  #     contains!(p, 3, 'oz')
  #   end
  # end
end
