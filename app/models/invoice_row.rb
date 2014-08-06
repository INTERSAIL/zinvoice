class InvoiceRow < ActiveRecord::Base
  belongs_to :invoice

  default_scope ->{ order :value }

  def json_value
    self.to_json
  end
end
