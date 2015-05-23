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

ActiveRecord::Schema.define(version: 20150523203012) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.time     "starttime"
    t.time     "endtime"
    t.date     "eventdate"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "externals", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.text     "description"
    t.integer  "position"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string "name"
    t.string "address"
    t.string "postcode"
    t.string "city"
    t.string "longitude"
    t.string "latitude"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "permalink"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.boolean  "main_navigation"
    t.boolean  "active"
  end

  create_table "posts", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.boolean  "active"
    t.integer  "position"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "location_id"
    t.integer  "teacher_id"
    t.boolean  "active"
    t.decimal  "price"
    t.integer  "position"
    t.integer  "category_id"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.text     "payment_details"
    t.boolean  "third_party"
    t.date     "startdate"
    t.text     "timefield"
  end

  add_index "products", ["active"], name: "index_products_on_active"
  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["teacher_id"], name: "index_products_on_teacher_id"

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.boolean  "accept_conditions"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "message"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "middle_name"
    t.date     "birth_date"
    t.string   "street"
    t.string   "street_number"
    t.string   "post_code"
    t.string   "city"
    t.string   "unconfirmed_email"
    t.boolean  "news_letter"
    t.string   "mobile"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
