class Invoice < ActiveRecord::Base
  belongs_to :customer
  has_many :invoice_rows

  accepts_nested_attributes_for :invoice_rows, allow_destroy: true
end
