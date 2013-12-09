class Address < ActiveRecord::Base
  attr_accessible :city, :country, :state, :street
end
