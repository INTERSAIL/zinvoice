# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "MyString"
    vat "MyString"
    address "MyString"
    cap "MyString"
    city "MyString"
    country "MyString"
    admin_email "MyString"
    note "MyText"
  end
end
