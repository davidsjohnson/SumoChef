require 'spec_helper'

describe UsersHelper do

	let(:user) { FactoryGirl.create(:user) }
	# before do 
 #  		let(:user) { FactoryGirl.create(:user) }
 #  	end

	it "should respond size options" do
		gravatar_for(user, size: 100).should =~ /s=100/
	end

	it "should have default size if not provided" do
		gravatar_for(user).should =~ /s=50/
	end
	
end