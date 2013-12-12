class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel
  attr_accessible :text
  validates_presence_of :text
end
