require 'spec_helper'

describe ShoppingList do
	let(:user) { FactoryGirl.create(:user) }
	before do
		@shopping_list = user.shopping_lists.build(description: "This is a List", state: "inactive")
	end

  subject { @shopping_list }
  
  it { should respond_to (:description) }
  it { should respond_to (:state) }
  it { should respond_to (:add_product!) }
  it { should respond_to (:remove_product!) }  
  it { should respond_to (:products) }

  it { should be_valid }

  its(:user) { should == user }

  describe "when description is not present" do 
  	before { @shopping_list.description = " " }
  	it { should_not be_valid }
  end

  describe "when state is not present" do 
  	before { @shopping_list.state = " " }
  	it { should_not be_valid }
  end

  describe "when user id not present" do
    before { @shopping_list.user_id = nil }
    it { should_not be_valid } 
  end

  describe "add and remove products" do
    let(:product) { FactoryGirl.create(:product) }
    before do 
      @shopping_list.save
      @shopping_list.add_product!(product)
    end

    describe "add product" do     
      its(:products) { should include(product) }
    end

    describe "remove item" do
      before { @shopping_list.remove_product!(product) }
      
      its(:products) { should_not include(product) } 
    end 
  end


end
