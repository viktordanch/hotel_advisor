require 'spec_helper'

describe Address do
  describe "create address" do
    it "should create address with valid params" do
      address = FactoryGirl.build(:address)
      expect(address.save).to be_true
    end
  end
end
