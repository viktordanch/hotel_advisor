class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find_by_id(params[:id])
    @address = @hotel.address
    @rating = @hotel.rating
  end

  def new
    @hotel = Hotel.new
  end

  def create


    @hotel = Hotel.new(params[:hotel])
    @rating = Rating.new(params[:rating])
    @address = Address.new(params[:address])

    Hotel.transaction do
      @hotel.ratings << @rating
      @hotel.address = @address
      @hotel.save!
      @address.save!
      @rating.save!

      redirect_to hotel_path(@hotel), notice: 'Hotel have created'
    end

  rescue Exception =>e
    @rating.valid?
    @address.valid?
    puts "------------error---------------------"
    puts "------------error---------------------"
    puts "------------error---------------------"
    puts "------------#{@rating.errors.messages.inspect}--------------------"
    puts "------------#{@rating.errors.messages.inspect}--------------------"
    puts "------------#{@address.errors.messages.inspect}--------------------"
    render :new


  end
end
