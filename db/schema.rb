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

ActiveRecord::Schema.define(version: 20160731214143) do

  create_table "membership_types", force: :cascade do |t|
    t.string   "name"
    t.string   "duration"
    t.text     "descprition"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal"
    t.string   "phone"
    t.string   "payment_type"
    t.string   "payment_type_id"
    t.datetime "last_paid"
    t.datetime "next_payment"
    t.text     "notes"
    t.integer  "membership_type_id"
    t.boolean  "email_communications"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["membership_type_id"], name: "index_memberships_on_membership_type_id"
  end

end
