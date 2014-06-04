class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :vat
      t.string :address
      t.string :cap
      t.string :city
      t.string :country
      t.string :admin_email
      t.text :note

      t.timestamps
    end
  end
end
