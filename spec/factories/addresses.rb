# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    country "MyString"
    state "MyString"
    city "MyString"
    street "MyString"
  end
end
