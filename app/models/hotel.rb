class Hotel < ActiveRecord::Base
  attr_accessible :breakfast, :description, :rating, :room_price, :title
end
