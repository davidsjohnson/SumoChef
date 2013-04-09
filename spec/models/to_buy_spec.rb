require 'spec_helper'

describe ToBuy do
  let(:user) { FactoryGirl.create(:user) }
  let(:product) { FactoryGirl.create(:product) }
  before do
  	@shopping_list = user.shopping_lists.build(description: "This is a List", state: "active")
  end

  

end
