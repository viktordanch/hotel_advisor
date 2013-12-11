class RatingsController < ApplicationController
  def create
    @hotel = Hotel.find_by_id(params[:hotel_id])
    @rating = @hotel.ratings.new(params[:rating])
    @rating.user = current_user
    @rating.save
    render partial: 'hotels/ratings';

  end
end
