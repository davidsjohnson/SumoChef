class RecipesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]
	include RecipesHelper

	def create
		product_ids = params[:recipe][:product_ids]
		params[:recipe].delete :product_ids
		@recipe = current_user.recipes.build(params[:recipe])
		if @recipe.save
			product_ids.each do |id|
				if id != ""
					product = Product.find(id)
					@recipe.contains!(product, 3, "oz")
				end
			end
			flash[:success] = "Your recipe has been created!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
	end

	def update
    if @recipe.update_attributes(params[:recipe])
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

end