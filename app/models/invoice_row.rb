class InvoiceRow < ActiveRecord::Base
  belongs_to :invoice

  def json_value
    self.to_json
  end
end
