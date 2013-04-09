class Manufacturer < ActiveRecord::Base
  attr_accessible :manufacturer_name

  validates :manufacturer_name, presence: true
end
