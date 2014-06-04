class Customer < ActiveRecord::Base
  has_many :supports
  has_many :invoices


  validates :vat, format: { with: /\A\d{11}\Z/, message: 'must have 11 digits' }
end
