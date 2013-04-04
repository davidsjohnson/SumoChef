require 'spec_helper'

describe Product do
	let(:product) { FactoryGirl.create(:product) }

	subject { product }

	it { should be_valid }

	it { should respond_to(:product_name) }
	it { should respond_to(:manufacturer_id) }
	it { should respond_to(:description) }

end
