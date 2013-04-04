require 'spec_helper'

describe Recipe do
	let(:user) { FactoryGirl.create(:user) }
	before do
		@recipe = user.recipes.build(directions: "Directions", recipe_name: "Recipe Name", recipe_category: "Category")
	end

	subject { @recipe }

	it { should respond_to(:description) }
	it { should respond_to(:directions) }
	it { should respond_to(:recipe_category) }
	it { should respond_to(:recipe_id) }
	it { should respond_to(:recipe_name) }
	it { should respond_to(:servings) }
	it { should respond_to(:total_cook_time) }
	it { should respond_to(:total_prep_time) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	it { should respond_to(:contains_products) }
	it { should respond_to(:products) }
	it { should respond_to(:contains!) }
	it { should respond_to(:contains?) }

   its(:user) { should == user }

	it { should be_valid }

	describe "when user id not present" do
		before { @recipe.user_id = nil }
		it { should_not be_valid }
	end

	describe "when name not present" do
		before { @recipe.recipe_name = nil }
		it { should_not be_valid }
	end

	describe "when directions not present" do
		before { @recipe.directions = nil }
		it { should_not be_valid }
	end
	
	describe "when category not present" do
		before { @recipe.recipe_category = nil }
		it { should_not be_valid }
	end

	describe "name too long" do
		before { @recipe.recipe_name = 'a' * 41 }
		it { should_not be_valid }
	end

	describe "description too long" do
		before { @recipe.description = 'a' * 101 }
		it { should_not be_valid }
	end

	describe "prep time too long" do
		before { @recipe.total_prep_time = 'a' * 11 }
		it { should_not be_valid }
	end

	describe "cook time too long" do
		before { @recipe.total_cook_time = 'a' * 11 }
		it { should_not be_valid }
	end

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Recipe.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "contains" do
		let(:product) { FactoryGirl.create(:product) }
		before do
			@recipe.save
			@recipe.contains!(product, 3, "Oz")
		end

		it { should be_contains(product) }
		its(:products) { should include(product) }
	end
end
