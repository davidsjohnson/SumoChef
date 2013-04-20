module RecipesHelper

  def owns_recipe?
    u = current_user
    @recipe = Recipe.find(params[:id])
    u.id == @recipe.user.id
  end

end