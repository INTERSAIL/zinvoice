class ChangeEmissionDateToInvoice < ActiveRecord::Migration
  def up
    change_column :invoices, :emission_date, :date
  end
  def down

  end
end
