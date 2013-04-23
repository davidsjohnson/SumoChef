class StaticPagesController < ApplicationController
  
  def index
  	 @recipes = Recipe.search(params[:search]).paginate(page: params[:page], per_page: 20)
  end

  def home
  	@recipes = Recipe.paginate(page: params[:page], per_page: 20)
  end

  def help
  end
end
