require 'spec_helper'

describe ContainsProduct do
  let(:recipe) { FactoryGirl.create(:recipe) }
  let(:product) { FactoryGirl.create(:product) }
  before do
    @contains_product = recipe.contains!(product, 3, "Cups") 
  end

  subject { @contains_product }

  it { should be_valid }

  describe "accessible attributes" do
  	it "should not allow access to recipe id" do
  		expect do
  			ContainsProduct.new(recipe_id: recipe.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  describe "recipe methods" do    
    it { should respond_to(:recipe) }
    it { should respond_to(:product) }
    its(:recipe) { should == recipe }
    its(:product) { should == product }
  end

  describe "when recipe id is not present" do
    before { @contains_product.recipe_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { @contains_product.product_id = nil }
    it { should_not be_valid }
  end
end
