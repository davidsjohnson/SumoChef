class Store < ActiveRecord::Base
  attr_accessible :address_city, :address_state, :address_street, :address_zip, :phone, :store_name
end
