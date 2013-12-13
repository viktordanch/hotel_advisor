# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

    factory :user do
      sequence(:email){|i| "email#{i}@mail.com"}
      password 11111111
      password_confirmation 11111111
    end

end
