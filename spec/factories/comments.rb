# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text "MyText"
    user nil
    hotel nil
  end
end
