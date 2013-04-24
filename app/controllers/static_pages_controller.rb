class StaticPagesController < ApplicationController
  
  def index
  	 @recipes = Recipe.search(params[:search]).paginate(page: params[:page], per_page: 20)
  	 @user = current_user
  	if signed_in?
  		@shopping_lists = @user.shopping_lists.find_all_by_state("active").paginate(page: params[:list_page], per_page: 3)
  	end
  end

  def home
  	@recipes = Recipe.paginate(page: params[:page], per_page: 20)
  	@user = current_user
  	if signed_in?
  		@shopping_lists = @user.shopping_lists.find_all_by_state("active").paginate(page: params[:list_page], per_page: 3)
  	end
  end

  def help
  end
end
