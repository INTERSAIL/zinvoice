# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140525160714) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "vat"
    t.string   "address"
    t.string   "cap"
    t.string   "city"
    t.string   "country"
    t.string   "admin_email"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_rows", force: true do |t|
    t.integer  "invoice_id"
    t.text     "desc"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "number"
    t.date     "emission_date"
    t.decimal  "value"
    t.decimal  "vat"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supports", force: true do |t|
    t.integer  "customer_id"
    t.datetime "from"
    t.datetime "to"
    t.integer  "ammount"
    t.string   "status"
    t.text     "desc"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
