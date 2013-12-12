class HotelsController < ApplicationController
  def index
    @hotels = Hotel.order('id DESC').all
    @best_hotels = Hotel.order('rating DESC').limit(5)
  end

  def show
    @hotel = Hotel.find_by_id(params[:id])
    @rating = Rating.new()
    @comment = Comment.new()
  end

  def new
    @hotel = Hotel.new
  end

  def create


    @hotel = Hotel.new(params[:hotel])

    @address = Address.new(params[:address])

    Hotel.transaction do

      @hotel.address = @address
      @hotel.save!
      @address.save!
      @rating = Rating.set_rating(@hotel,params[:hotel][:rating], current_user)


      redirect_to hotel_path(@hotel), notice: 'Hotel have created'
    end

  rescue ActiveRecord::RecordInvalid =>e

    @address.valid?

    #puts "------------#{@rating.errors.messages.inspect}--------------------"
    #puts "------------#{@rating.errors.messages.inspect}--------------------"
    puts "------------#{@address.errors.messages.inspect}--------------------"
    render :new


  end
end
