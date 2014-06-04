class RenameAmmountToInvoice < ActiveRecord::Migration
  def change
    rename_column :invoices, :ammount, :value
  end
end
