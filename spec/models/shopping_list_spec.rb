require 'spec_helper'

describe ShoppingList do
	let(:user) { FactoryGirl.create(:user) }
	before do
		@shopping_list = user.shopping_lists.build(description: "This is a List", state: "active")
	end

  subject { @shopping_list }
  
  it { should respond_to (:description) }
  it { should respond_to (:state) }
  it { should respond_to (:add_item!) }
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

  describe "add item" do
    let(:product) { FactoryGirl.create(:product) }
    before do
      @shopping_list.save
      @shopping_list.add_item!(product)
    end

    its(:products) { should include(product) }
  end
  

end
