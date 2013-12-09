# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hotel do
    title "MyString"
    rating 1.5
    breakfast false
    description "MyText"
    room_price "MyString"
  end
end
