class Rating < ActiveRecord::Base
  belongs_to :hotel
  attr_accessible :star
end
