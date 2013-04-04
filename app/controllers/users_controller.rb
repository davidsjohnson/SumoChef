class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]

  def show
		@user = User.find(params[:id])
    @recipes = @user.recipes.paginate(page: params[:page], per_page: 10)
	end

  def new
  		@user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
    	flash[:success] = "Welcome to SumoChef!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
