class Address < ActiveRecord::Base
  belongs_to :hotel
  attr_accessible :city, :country, :state, :street
end
