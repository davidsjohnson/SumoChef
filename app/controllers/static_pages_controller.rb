class StaticPagesController < ApplicationController
  
  def home
  	@recipes = Recipe.paginate(page: params[:page], per_page: 20)
  end

  def help
  end
end
