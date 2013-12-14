require 'spec_helper'

describe RatingsController do
  include Devise::TestHelpers
  before(:each){
    user = FactoryGirl.create(:user)
    sign_in user

  }

  describe "POST 'create'" do
    let!(:hotel) {@hotel =  FactoryGirl.create(:hotel)}

    it "returns http success" do

      post :create, hotel_id: @hotel, star: 4

      expect(response.status).to eq(200)
      response.should be_success
    end

    it "render partial hotels/_ratings" do


      post :create, hotel_id: @hotel, star: 3

      expect(response).to render_template("hotels/_ratings")
    end

    it "render  @hotel and @rating " do

      post :create, hotel_id: @hotel, star: 4

      expect(assigns(:hotel)).to eq(@hotel)
      expect(assigns(:rating)).to be_true
    end

  end


end
