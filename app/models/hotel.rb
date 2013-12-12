class Hotel < ActiveRecord::Base
  has_one :address
  has_many :ratings
  has_many :comments
  attr_accessible :breakfast, :description, :rating, :room_price, :title, :image,  :remote_image_url

  mount_uploader :image, ImageUploader
end
