class RecipesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]
	include RecipesHelper

	def new
  		@recipe = Recipe.new
  	end

	def create
	 	@product1 = Product.find(params[:product1][:id])
	 	@product2 = Product.find(params[:product2][:id])
	 	@product3 = Product.find(params[:product3][:id])
		@recipe = current_user.recipes.build(params[:recipe])
		if @recipe.save
	    	@recipe.products.each do |p|
	    		@recipe.delete_product(p)
	    	end
	    	@recipe.contains!(@product1)
	    	@recipe.contains!(@product2)
	    	@recipe.contains!(@product3)
			flash[:success] = "Your recipe has been created!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@recipe = Recipe.find(params[:id])
		@product1 = @recipe.products[0]
		@product2 = @recipe.products[1]
		@product3 = @recipe.products[2]
	end

	def update
	 @recipe = Recipe.find(params[:id])
	 @product1 = Product.find(params[:product1][:id])
	 @product2 = Product.find(params[:product2][:id])
	 @product3 = Product.find(params[:product3][:id])
    if @recipe.update_attributes(params[:recipe])
    	@recipe.products.each do |p|
    		@recipe.delete_product(p)
    	end
    	@recipe.contains!(@product1)
    	@recipe.contains!(@product2)
    	@recipe.contains!(@product3)
      flash[:success] = "Recipe updated!"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def destroy
		Recipe.find(params[:id]).destroy
    	flash[:success] = "Recipe has been deleted!"
    	redirect_to root_url
	end

	def add_to_list
		@recipe = Recipe.find(params[:id])
		shopping_list = ShoppingList.find(params[:ShoppingList][:id])
		@recipe.products.each do |p|
			shopping_list.add_product!(p)
		end
		flash[:success] = "Ingredients have been added to your '" + shopping_list.description + "' shopping list!"
		redirect_to @recipe
	end

end