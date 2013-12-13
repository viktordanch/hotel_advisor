require 'spec_helper'

describe Rating do
  describe "create rating" do
    it "should create rating with valid params" do
      rating = FactoryGirl.build(:rating)
      expect(rating.save).to be_true
    end
    it "should not create rating without invalid params" do
      rating = FactoryGirl.build(:rating, star: '')
      rating1 = FactoryGirl.build(:rating, star: '0')
      rating2 = FactoryGirl.build(:rating, star: '7')

      expect(rating.save).to be_false
      expect(rating1.save).to be_false
      expect(rating2.save).to be_false
    end
    it "should create rating" do
      hotel = FactoryGirl.build(:hotel)
      user = FactoryGirl.build(:user)
      star = 2
      rating = Rating.new_rating(hotel, user, star)

      expect(rating.id.blank?).to be_false
    end

   it "should calculate average rating" do
      hotel = FactoryGirl.create(:hotel,title: 'rate hotel')
      user = FactoryGirl.build(:user)
      user2 = FactoryGirl.build(:user)
      star = 4
      star2 = 2
      rating = Rating.set_rating(hotel, star, user)
      rating = Rating.set_rating(hotel, star2, user2)

      expect(hotel.rating).to eq(3)
   end
   it "User can't rate hotel twice" do
      hotel = FactoryGirl.create(:hotel,title: 'rate hotel', rating: 2)
      user = FactoryGirl.build(:user)

      hotel.save
      star = 4
      rating = Rating.set_rating(hotel,star, user)

      expect(rating.id.blank?).to be_false
      expect(hotel.rating).to eq(4)
    end


  end
end
