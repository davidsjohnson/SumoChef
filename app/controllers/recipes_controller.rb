class RecipesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]

	def create
		@recipe = current_user.recipes.build(params[:recipe])
		if @recipe.save
			flash[:success] = "Your recipe has been created!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def edit
	end

	def update
    if @recipe.update_attributes(params[:recipe])
      flash[:success] = "Profile updated!"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def destroy
	end

end