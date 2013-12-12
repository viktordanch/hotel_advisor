class Hotel < ActiveRecord::Base
  has_one :address
  has_many :ratings
  has_many :comments
  attr_accessible :breakfast, :description, :rating, :room_price, :title, :image,  :remote_image_url

  validates_presence_of :title, :rating
  validates :rating,  numericality: { only_integer: true , less_than: 5, greater_than: 1}
  validates :room_price,  numericality: { only_integer: true , less_than: 5, greater_than: 1}, if: :room_price
  validates :image, format: { with: /.png|.gif|.jpg|.jpeg|.JPEG|.PNG|.JPG/, message: "only image (.jpg, .png, .gif)" }
  mount_uploader :image, ImageUploader
end
