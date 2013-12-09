class Hotel < ActiveRecord::Base
  has_one :address
  has_many :ratings
  attr_accessible :breakfast, :description, :rating, :room_price, :title
end
