require 'spec_helper'

describe HotelsController do
  include Devise::TestHelpers
  before(:each){
    user = FactoryGirl.create(:user)
    sign_in user

  }

  describe "GET 'index'" do


    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "render template 'index'" do
      get 'index'

      expect(response).to render_template('hotels/index')
    end

    it "render object @hotels, @best_hotels" do

      get 'index'

      expect(assigns(:hotels)).to  be_true
      expect(assigns(:best_hotels)).to be_true

    end

    it "render object hotels in right orders" do

      hotels=[]
      5.times do |i|
        hotels << FactoryGirl.create(:hotel, rating: (i+1))
      end
      get 'index'

      expect(assigns(:best_hotels)).to match_array(hotels.reverse![0,5])

    end

  end

  describe "GET 'show'" do

    let!(:hotel) {@hotel =  FactoryGirl.create(:hotel)}
    it "returns http success" do
      get 'show', id: @hotel
      response.should be_success
    end

    it "render template 'show'" do
      get 'show', id: @hotel

      expect(response).to render_template('hotels/show')
    end

    it "render object @hotel, @rating, @comment" do

      get 'show', id: @hotel

      expect(assigns(:hotel)).to eq(@hotel)
      expect(assigns(:rating)).to  be_true
      expect(assigns(:comment)).to be_true

    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

   it "render template 'new'" do
      get 'new'
      expect(response).to render_template('hotels/new')
    end

   it "render object @hotel" do
      get 'new'
      expect(assigns(:hotel)).to be_true
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end



    describe "save with valid params" do
      it "save hotel and address in db" do

        @hotel_attributes = FactoryGirl.attributes_for(:hotel)
        @address_attributes = FactoryGirl.attributes_for(:address)

        expect {
          post 'create', hotel: @hotel_attributes, address: @address_attributes
        }.to change(Hotel, :count).by(1)

        expect {
          post 'create', hotel: @hotel_attributes, address: @address_attributes
        }.to change(Address, :count).by(1)
      end

      it "should redirect to show action"  do
        @hotel_attributes = FactoryGirl.attributes_for(:hotel)
        @address_attributes = FactoryGirl.attributes_for(:address)

        post 'create', hotel: @hotel_attributes, address: @address_attributes


        subject.should redirect_to("/hotels/#{assigns(:hotel).id}")


      end

    end

  describe "save with invalid params" do
      it "not save hotel and address" do


        @address_attributes = FactoryGirl.attributes_for(:address)

        expect {
          post 'create', hotel: @hotel_attributes, address: @address_attributes
        }.to change(Hotel, :count).by(0)

        expect {
          post 'create', hotel: @hotel_attributes, address: @address_attributes
        }.to change(Address, :count).by(0)
      end

      it "should render to template new"  do
        @hotel_attributes = FactoryGirl.attributes_for(:hotel, title: '')
        @address_attributes = FactoryGirl.attributes_for(:address)

        post 'create', hotel: @hotel_attributes, address: @address_attributes


        expect(response).to render_template("hotels/new")


      end

    end

  end


end
