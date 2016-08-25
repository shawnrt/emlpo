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

ActiveRecord::Schema.define(version: 20160824170149) do

  create_table "charges", force: :cascade do |t|
    t.integer  "membership_id"
    t.string   "stripe_token"
    t.string   "customer_id"
    t.string   "charge_id"
    t.integer  "membership_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["membership_id"], name: "index_charges_on_membership_id"
    t.index ["membership_type_id"], name: "index_charges_on_membership_type_id"
  end

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
    t.text     "token"
    t.index ["membership_type_id"], name: "index_memberships_on_membership_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
