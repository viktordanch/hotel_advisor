# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hotel do
    title "MyString"
    rating 1
    breakfast false
    description "MyText"
    room_price 1.5

    image  File.open(File.join(Rails.root.join,'app/assets/images/rails.png'))
  end
end
#:breakfast,/ :description,/ :rating,/ :room_price,/ :title/, :image,  :remote_image_url