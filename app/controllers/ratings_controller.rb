class RatingsController < ApplicationController
  def create
    puts "-------------ratind-controller---------------------------"
    puts "-------------#{params}---------------------------"
    @hotel = Hotel.find_by_id(params[:hotel_id])
    @rating = Rating.set_rating(@hotel,params[:star], current_user)
    puts "------------------rating---------------------------"
    puts "------------#{@rating.errors.messages.inspect}-------------------------"
    render partial: 'hotels/ratings';


  end
end
