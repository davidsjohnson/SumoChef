require 'spec_helper'

describe "RecipesPages" do
	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "recipe create" do
		before { visit root_path }

		describe "with invalid information" do

			it "should not create a recipe" do
				expect { click_button "Create recipe" }.not_to change(Recipe, :count)
			end

			describe "error message" do
				before { click_button "Create recipe" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do
			before do
				fill_in "Recipe name", with: "Grilled Food"
				fill_in "Description", with: "A description of the grilled recipe"
				fill_in "Directions", with: "1. Do one thing\n2. Do two things\n3.Finish it!!"
				fill_in "Recipe category", with: "Grilled"
				fill_in "Servings", with: 8
			end

			it "should create a new recipe" do
				expect { click_button "Create recipe" }.to change(Recipe, :count).by(1)
			end
		end

	end
end
