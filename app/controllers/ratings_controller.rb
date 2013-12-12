class RatingsController < ApplicationController
  def create
    puts "-------------ratind-controller---------------------------"
    puts "-------------#{params}---------------------------"
    @hotel = Hotel.find_by_id(params[:hotel_id])
    Rating.set_rating(@hotel,params[:star], current_user)
    render partial: 'hotels/ratings';

  end
end
