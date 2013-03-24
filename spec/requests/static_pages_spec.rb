require 'spec_helper'

describe "Static pages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: full_title(page_title)) }
	end

	describe "Home Page" do
		before { visit root_path }
		let(:heading) { 'Welcome to SumoChef' }
		let(:page_title) { '' }

		it_should_behave_like "all static pages"
		it { should_not have_selector('title', text: '| Home') }
	end

	describe "Help Page" do
		before { visit help_path }
		let(:heading) { 'Help' }
		let(:page_title) { 'Help' }

		it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
		visit root_path

		click_link "Home"
		page.should have_selector 'h1', text: 'SumoChef'
		click_link "Help"
		page.should have_selector 'h1', text: 'Help'
		click_link "SumoChef"
		page.should have_selector 'h1', text: 'SumoChef'
  	end
end