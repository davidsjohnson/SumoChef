class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :get_new_recipe

  def get_new_recipe
  	@recipe = current_user.recipes.build if signed_in?
  end

  # Force Signout to prevent CSRF attacks
  def handle_unverified_request
  	sign_out
  	super
  end
end
