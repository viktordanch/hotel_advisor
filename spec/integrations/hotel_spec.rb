require 'spec_helper'

describe 'hotel page' do


  describe 'visit sign in page' do

   it 'describe sign in page ' do
    visit 'users/sign_in'
    #let!(:hotel2){ FactoryGirl.create(:hotel, current_rating: 4)}

    #puts "--------------------------------------let------------------------------------------------------"
    #puts "-----------#{Hotel.count}-----------------"

    #before {
    #  FactoryGirl.create( :hotel)
    #  visit '/hotels' }
    #it 'should show all hotels', js: true do
    #
    #
    #puts "--------------------------------------let------------------------------------------------------"
    #puts "-----------#{Hotel.count.to_s}-----------------"
    #
    #
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    #expect(page).to have_content 'Best hotels'
    #
    #expect(page).to have_link('create new hotel')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')

  end
  end




end