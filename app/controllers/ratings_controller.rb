class RatingsController < ApplicationController

  def create


    @hotel = Hotel.find_by_id(params[:hotel_id])
    @rating = Rating.set_rating(@hotel,params[:rating][:star], current_user)

    render partial: 'hotels/ratings', :locals => {:hotel => @hotel, rating: @rating}
  end

end
