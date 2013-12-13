require 'spec_helper'

describe Hotel do
  describe "create hotel" do
    it "should create hotel with valid params" do
      hotel = FactoryGirl.build(:hotel)

      expect(hotel.save).to be_true
    end
    it "should not save hotel with blank title or rating" do
      hotel = FactoryGirl.build(:hotel, title: '')
      hotel1 = FactoryGirl.build(:hotel, rating: '')

      expect(hotel.save).to be_false
      expect(hotel1.save).to be_false
    end
    it "should not save hotel with bad rating format" do
      hotel = FactoryGirl.build(:hotel, rating: 'sdfasd')
      hotel1 = FactoryGirl.build(:hotel, rating: 0)
      hotel2 = FactoryGirl.build(:hotel, rating: 6)


      expect(hotel.save).to be_false
      expect(hotel1.save).to be_false
      expect(hotel2.save).to be_false
    end
    it "should not save hotel with invalid room price" do
      hotel = FactoryGirl.build(:hotel, room_price: 'qwe')
      hotel = FactoryGirl.build(:hotel, room_price: 0)

      expect(hotel.save).to be_false
      expect(hotel.save).to be_false
    end
    it "should not save hotel with invalid image format" do
      hotel = FactoryGirl.build(:hotel, image:  File.open(File.join(Rails.root.join,'/public/robots.txt')))
      expect(hotel.save).to be_false
    end
  end
end
