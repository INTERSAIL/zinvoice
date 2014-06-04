class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.integer :customer_id
      t.datetime :from
      t.datetime :to
      t.integer :ammount
      t.string :status
      t.text :desc
      t.text :note

      t.timestamps
    end
  end
end
