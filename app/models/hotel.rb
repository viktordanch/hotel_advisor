class Hotel < ActiveRecord::Base
  has_one :address
  has_many :ratings
  has_many :comments
  attr_accessible :breakfast, :description, :rating, :room_price, :title, :image,  :remote_image_url

  validates_presence_of :title, :rating
  validates :rating,  numericality: { only_integer: true , less_than: 6, greater_than: 0}
  validates :room_price, :numericality=> {greater_than: 0} , if: :present
  validates :image, format: { with: /.png|.gif|.jpg|.jpeg|.JPEG|.PNG|.JPG/, message: "only image (.jpg, .png, .gif)" }
  mount_uploader :image, ImageUploader
  def present
    ! self.room_price.blank?
  end
end
