class ShoppingListsController < ApplicationController
	before_filter :signed_in_user
	#before_filter :correct_user, only: [:edit, :update]

	def new
		@shopping_list = ShoppingList.new
	end

	def show
		@shopping_list = ShoppingList.find(params[:id])
		@user = current_user
	end

	def index
		@user = current_user
		@shopping_lists = @user.shopping_lists.paginate(page: params[:page], per_page: 3)
	end

	def edit
	end

	def update
		@shopping_list = ShoppingList.find(params[:id])
		logger.debug "ShoppingList: #{params}"
	   if @shopping_list.add_product!(Product.find(params[:Product][:id]))
			flash[:success] = "Product added to shopping list!"
			redirect_to @shopping_list
		else
			render 'show'
		end
	end

  def create
    @shopping_list = current_user.shopping_lists.build(params[:shopping_list])
    if @shopping_list.save
    	flash[:success] = "New shopping list created!"
      redirect_to shopping_lists_path
    else
      render 'new'
    end
  end

end
