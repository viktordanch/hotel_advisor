require 'spec_helper'

describe CommentsController do

  include Devise::TestHelpers
  before(:each){
    user = FactoryGirl.create(:user)
    @comment_attributes = FactoryGirl.attributes_for(:comment)
    sign_in user

  }

  describe "POST 'create'" do

    let!(:hotel) {@hotel =  FactoryGirl.create(:hotel)}

    it "returns http success" do


      post :create, hotel_id: @hotel, comment: @comment_attributes

      expect(response.status).to eq(200)
      response.should be_success
    end

  it "render partial hotels/_comments" do


      post :create, hotel_id: @hotel, comment: @comment_attributes

      expect(response).to render_template("hotels/_comments")
    end

   it "render  @hotel and @comment " do

      post :create, hotel_id: @hotel, comment: @comment_attributes

      expect(assigns(:hotel)).to eq(@hotel)
      expect(assigns(:comment)).to be_true
    end
  end

end
