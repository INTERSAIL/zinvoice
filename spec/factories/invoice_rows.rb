# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice_row do
    invoice_id 1
    desc "MyText"
    value "9.99"
  end
end
