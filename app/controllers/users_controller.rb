require 'will_paginate/array'

class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  def show
		@user = User.find(params[:id])
    @recipes = @user.recipes.paginate(page: params[:recipe_page], per_page: 10)
    @shopping_lists = @user.shopping_lists.find_all_by_state("active").paginate(page: params[:list_page], per_page: 3)
	end

  def new
  		@user = User.new
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
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
