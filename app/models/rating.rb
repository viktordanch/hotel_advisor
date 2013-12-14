class Rating < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  attr_accessible :star
  validates_presence_of :star
  validates :star,  numericality: { only_integer: true , less_than: 6, greater_than: 0}



  def self.set_rating(hotel, rating, user)

    users_rating = hotel.ratings.where(user_id: user.id)
      if  users_rating.blank?

        @rating = Rating.new_rating(hotel, user, rating)
      else

        users_rating.first.update_attributes(star: rating)

        @rating = users_rating.first
      end

    hotel.update_attributes(rating: Rating.where(hotel_id: hotel.id).average(:star).to_i)

    hotel.save
    @rating

  end

  def self.new_rating(hotel, user, rating)
    @rating = hotel.ratings.new(star: rating)
    @rating.user = user
    @rating.save
    @rating
  end

end
