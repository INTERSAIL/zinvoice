class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.datetime :emission_date
      t.decimal :ammount
      t.decimal :vat
      t.integer :customer_id

      t.timestamps
    end
  end
end
