require 'spec_helper'

describe User do
  describe "create" do
    it "should save user with right params" do
      user = FactoryGirl.build(:user)
      expect(user.save).to be_true
    end

    it "should not save user with invalid params" do
      user = FactoryGirl.build(:user, email: '')
      user2 = FactoryGirl.build(:user, password_confirmation: '')
      expect(user.save).to be_false
      expect(user2.save).to be_false
    end

    it "should not save user with unequal password and password confirmation" do
      user = FactoryGirl.build(:user, password_confirmation: 21121111)
      expect(user.save).to be_false
    end

    it "should not save users with equal emails" do
      user2 = FactoryGirl.create(:user, email: 'myemail@gmail.com')
      user = FactoryGirl.build(:user, email: 'myemail@gmail.com')
      expect(user.save).to be_false
    end


  end
end
