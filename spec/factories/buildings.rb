# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address "MyString"
    city "MyString"
    state "MyString"
    postal_code 02215
  end
end
