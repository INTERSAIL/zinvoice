class CreateInvoiceRows < ActiveRecord::Migration
  def change
    create_table :invoice_rows do |t|
      t.integer :invoice_id
      t.text :desc
      t.decimal :value

      t.timestamps
    end
  end
end
