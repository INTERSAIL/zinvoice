# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    number 1
    emission_date "2014-05-03 01:01:32"
    ammount "9.99"
    vat "9.99"
    customer_id 1
  end
end
