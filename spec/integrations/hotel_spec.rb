require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'hotel page' do


  describe 'external pages' do

     it 'describe sign in page ' do
      visit '/users/sign_in'
      expect(page).to have_content 'Sign in'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'

      expect(page).to  have_css('input[value="Sign in"]')
      expect(page).to have_link('Sing up')

     end

     it 'describe sign up page ' do
      visit '/users/sign_in'

      click_link("Sing up")
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'
      expect(page).to have_content 'Password confirmation'

      expect(page).to  have_css('input[value="Sign up"]')
      expect(page).to have_link('Sing in')

     end

    it 'describe sing up form' do

      visit '/users/sign_up'

      fill_in('Email', :with => 'mail@mail.com')
      find('#user_password').set(123456789)
      find('#user_password_confirmation').set(123456789)

      click_button("Sign up")

      expect(page).to have_content 'All hotels'
      expect(page).to have_content 'Best hotels'
    end

    it 'describe sing in form' do
     FactoryGirl.create(:user, email: 'mail@mail.com')

     visit '/users/sign_in'


      fill_in('Email', :with => 'mail@mail.com')
      fill_in('Password', :with => 11111111)

      click_button("Sign in")

      expect(page).to have_content 'All hotels'
      expect(page).to have_content 'Best hotels'
    end

     it 'describe error message in  sign up form' do
       visit '/users/sign_up'

       fill_in('Email', :with => '')
       find('#user_password_confirmation').set('')

       click_button('Sign up')

       page.all('body', :text => "can't be blank").count == 2

     end
    it 'describe error message in sign in form' do
      visit '/users/sign_in'

      fill_in('Email', :with => '')
      fill_in('Password', :with => '')

      click_button('Sign in')

      expect(page).to have_content "Invalid email or password."


    end

  end

  describe "internal pages" do
    #include Devise::TestHelpers
    before(:each){
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)

    }
    #after(:each){
    #  logout(:user)
    #}
    it 'describe index page' do

      5.times do
        FactoryGirl.create(:hotel, title: 'Hotel')
      end

      visit '/hotels'

      expect(page).to have_link 'show'
      expect(page).to have_link 'Add hotel'
      expect(page).to have_content 'Hotel'
      expect(page).to have_content 'All hotels'
      expect(page).to have_content 'Best hotels'
    end

    it 'describe show page' do
      FactoryGirl.create(:hotel, title: 'Hotel')

      visit '/hotels'
      find('.hotels-table').click_link('show')

      expect(page).to have_link 'Back to list'
      expect(page).to have_button 'Add comment'
      expect(page).to have_button 'Rate'
      expect(page).to have_content 'Hotel'
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Include breakfast'
      expect(page).to have_content 'Price for room'
      expect(page).to have_content 'Room description'
      expect(page).to have_content 'Country'
      expect(page).to have_content 'State'
      expect(page).to have_content 'City'
      expect(page).to have_content 'Street'
      expect(page).to have_content 'Comments'
      expect(page).to have_content 'Hotel rating'
      expect(page).to have_content 'Leave your rating'
    end
    it 'describe new page' do

      visit '/hotels'
      click_link('Add hotel')

      expect(page).to have_content 'New hotel'
      expect(page).to have_link 'Back to list'
      expect(page).to have_button 'Create'

      expect(page).to have_content 'Title'
      expect(page).to have_content 'Start rating'
      expect(page).to have_content 'Photo'
      expect(page).to have_content 'Link on photo'
      expect(page).to have_content 'Include breakfast'
      expect(page).to have_content 'Price for room'
      expect(page).to have_content 'Room description'
      expect(page).to have_content 'Country'
      expect(page).to have_content 'State'
      expect(page).to have_content 'City'
      expect(page).to have_content 'Street'

    end
   it 'describe create hotel form ' do
     visit '/hotels/new'

     fill_in('Title', :with => 'Test hotel')
     fill_in('Start rating', :with => 4)
     fill_in('Room description', :with => "Description for test hotel's room")
     fill_in('Price for room', :with => 4.45)
     check('Include breakfast')
     #attach_file('Photo', '/path/to/image.jpg')
     fill_in('Link on photo', :with =>"http://ru.hotelhawaiiibiza.com/uploads/fotoservicio/piscina-hotel-intertur-hawaii-ibiza.jpg")
     select('Andorra', :from => 'Country')
     fill_in('State', :with => 'California')
     fill_in('City', :with => "Monterey")
     fill_in('Street', :with => "Green 123")

     click_button('Create')

      expect(page).to have_content 'Test hotel'


      expect(page).to have_content 4.0
      expect(page).to have_content "Description for test hotel's room"
      expect(page).to have_content  4.45
      expect(page).to have_content 'Yes'
      expect(page).to have_content 'Andorra'
      expect(page).to have_content 'California'
      expect(page).to have_content 'Monterey'
      expect(page).to have_content 'Green 123'


   end

    it 'describe create comment form ' do
      FactoryGirl.create(:hotel, title: 'Hotel')

      visit '/hotels'
      find('.hotels-table').click_link('show')

     fill_in('comment text', :with => 'Add comment for test')

     click_button('Add comment')

     expect(page).to have_content 'Add comment for test'

    end
    it 'describe create rating form ' do
      hotel = FactoryGirl.create(:hotel, rating: 2)

      visit '/hotels'
      find('.hotels-table').click_link('show')


    fill_in('Star', :with => 4)


    click_button('Rate')


      expect(page).to have_content 4.0

    end

    it 'describe error messages in rating form ' do
      hotel = FactoryGirl.create(:hotel, rating: 2)

      visit '/hotels'
      find('.hotels-table').click_link('show')


    fill_in('Star', :with =>'')


    click_button('Rate')


      expect(page).to have_content "can't be blank"

    end


    it 'describe error messages in comment form ' do
      FactoryGirl.create(:hotel, title: 'Hotel')

      visit '/hotels'
      find('.hotels-table').click_link('show')

     click_button('Add comment')
      sleep(3)


      expect(page).to have_content "can't be blank"

    end

    it 'describe error message in  hotel form ' do
      visit '/hotels/new'

      fill_in('Title', :with => '')
      fill_in('Start rating', :with => 7)
      fill_in('Room description', :with => "Description for test hotel's room")
      fill_in('Price for room', :with => "string")
      check('Include breakfast')
      #attach_file('Photo', '/path/to/image.jpg')
      fill_in('Link on photo', :with =>"http://stackoverflow.com/questions/11775913/capybara-ajax-race-conditions")
      select('Andorra', :from => 'Country')
      fill_in('State', :with => 'California')
      fill_in('City', :with => "Monterey")
      fill_in('Street', :with => "Green 123")

      click_button('Create')

      expect(page).to have_content "can't be blank"
      expect(page).to have_content "must be less than 6"
      expect(page).to have_content 'is not a number'
      expect(page).to have_content 'only image (.jpg, .png, .gif)'



    end

    it 'describe log out' do
      visit '/hotels'



      click_link('Log out')

      expect(page).to have_content "Sign in"


    end

  end




end