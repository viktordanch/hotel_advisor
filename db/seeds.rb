# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hotel_images = ['http://www.globalhotel.com/images/img-home.jpg', 'http://www.ahmedabad.com/wp-content/uploads/2010/04/Sarovar-Hotels-Ahmedabad.jpg',
                "http://www.aecom.com/deployedfiles/Internet/Capabilities/Design%20and%20Planning/images/DP_Leisure_Hotels_SandyLaneHotel_mainimg.jpg" ,
                "http://media-cdn.tripadvisor.com/media/photo-s/01/a5/b0/1a/inntel-hotels-rotterdam.jpg",
                "http://media-cdn.tripadvisor.com/media/photo-s/03/cd/e8/a8/grifid-hotels-club-hotel.jpg",
                "http://www.shangri-la.com/uploadedImages/Shangri-la_Hotels/Shangri-La_Hotel,_Dalian/SLDA-Bg-Hotel-Exterior.jpg",
                "http://www.cityhotelderry.com/images_/cropped-night-shot-3431.jpg-cropper-870x400.jpg",
                "http://www.hotelchatter.com/files/admin/deathstarhotel.jpg",
                "http://www.h10hotels.com/hotels/jpg/galeria/zoom/HT/ht_1478863437.jpg"]


puts "-------------------------------create hotels --------------------------------"
z = 0
9.times do |i|
puts "---------------#{i}---------------------------"

   z +=1 if z<1
   z = 1 if z > 5
   hotel = Hotel.new(title: "Hotel#{i}", rating: z, breakfast: true, description: 'very nice room', room_price: 4.45,
                     remote_image_url:  hotel_images[i] )
   address =  Address.new(country: 'USA', state: 'New York', city: 'New York City', street: '15')

   hotel.address = address
  hotel.save
   z +=1

end
