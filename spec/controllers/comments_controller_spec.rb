require 'spec_helper'

describe CommentsController do

  include Devise::TestHelpers
  before(:each){
    user = FactoryGirl.create(:user)
    sign_in user

  }

  describe "POST 'create'" do

    let!(:hotel) {@hotel =  FactoryGirl.create(:hotel)}

    it "returns http success" do


      post :create, hotel_id: @hotel, text: 'test comment'

      expect(response.status).to eq(200)
      response.should be_success
    end

  it "render partial hotels/_comments" do


      post :create, hotel_id: @hotel, text: 'test comment'

      expect(response).to render_template("hotels/_comments")
    end

   it "render  @hotel and @comment " do

      post :create, hotel_id: @hotel, text: 'test comment'

      expect(assigns(:hotel)).to eq(@hotel)
      expect(assigns(:comment)).to be_true
    end
  end

end
