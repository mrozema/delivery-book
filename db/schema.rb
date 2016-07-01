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

ActiveRecord::Schema.define(version: 20160701175344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "customer_id"
    t.boolean  "is_primary"
    t.string   "phone_number"
    t.string   "street_address"
    t.string   "street_address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country",         default: "USA"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree
  add_index "addresses", ["deleted_at"], name: "index_addresses_on_deleted_at", using: :btree
  add_index "addresses", ["phone_number"], name: "index_addresses_on_phone_number", using: :btree

  create_table "addresses_sales", id: false, force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "sale_id",    null: false
  end

  add_index "addresses_sales", ["address_id"], name: "address_on_addr_id", using: :btree
  add_index "addresses_sales", ["sale_id"], name: "address_on_sale_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",        default: "",   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.boolean  "email_opt_in", default: true
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
  end

  add_index "customers", ["deleted_at"], name: "index_customers_on_deleted_at", using: :btree
  add_index "customers", ["email"], name: "index_customers_on_email", using: :btree
  add_index "customers", ["last_name"], name: "index_customers_on_last_name", using: :btree
  add_index "customers", ["phone_number"], name: "index_customers_on_phone_number", using: :btree

  create_table "deliveries", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "scheduled_delivery_id"
    t.datetime "delivery_date"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
  end

  add_index "deliveries", ["deleted_at"], name: "index_deliveries_on_deleted_at", using: :btree
  add_index "deliveries", ["delivery_date"], name: "index_deliveries_on_delivery_date", using: :btree
  add_index "deliveries", ["scheduled_delivery_id"], name: "index_deliveries_on_scheduled_delivery_id", using: :btree
  add_index "deliveries", ["vehicle_id"], name: "index_deliveries_on_vehicle_id", using: :btree

  create_table "deliveries_users", id: false, force: :cascade do |t|
    t.integer "delivery_id", null: false
    t.integer "user_id",     null: false
  end

  add_index "deliveries_users", ["delivery_id"], name: "delivery_on_delivery_id", using: :btree
  add_index "deliveries_users", ["user_id"], name: "delivery_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "delivery_id"
    t.integer  "scheduled_delivery_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "model"
    t.string   "serial"
    t.string   "brand"
    t.boolean  "sold",                  default: false
  end

  add_index "items", ["brand"], name: "index_items_on_brand", using: :btree
  add_index "items", ["deleted_at"], name: "index_items_on_deleted_at", using: :btree
  add_index "items", ["model"], name: "index_items_on_model", using: :btree
  add_index "items", ["serial"], name: "index_items_on_serial", using: :btree
  add_index "items", ["sold"], name: "index_items_on_sold", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "sale_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "notes"
  end

  add_index "sales", ["customer_id"], name: "index_sales_on_customer_id", using: :btree
  add_index "sales", ["deleted_at"], name: "index_sales_on_deleted_at", using: :btree
  add_index "sales", ["sale_date"], name: "index_sales_on_sale_date", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "scheduled_deliveries", force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "sale_id"
    t.datetime "scheduled_delivery_date"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
  end

  add_index "scheduled_deliveries", ["deleted_at"], name: "index_scheduled_deliveries_on_deleted_at", using: :btree
  add_index "scheduled_deliveries", ["sale_id"], name: "index_scheduled_deliveries_on_sale_id", using: :btree
  add_index "scheduled_deliveries", ["scheduled_delivery_date"], name: "index_scheduled_deliveries_on_scheduled_delivery_date", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "teams", ["deleted_at"], name: "index_teams_on_deleted_at", using: :btree
  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "team_id",                 null: false
    t.integer "user_id",                 null: false
    t.boolean "admin",   default: false
  end

  add_index "teams_users", ["team_id"], name: "team_on_team_id", using: :btree
  add_index "teams_users", ["user_id"], name: "team_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "authentication_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "title"
    t.boolean  "super_user",             default: false
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "make"
    t.string   "model"
    t.string   "year"
  end

  add_index "vehicles", ["deleted_at"], name: "index_vehicles_on_deleted_at", using: :btree

end
