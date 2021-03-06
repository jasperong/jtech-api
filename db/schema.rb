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

ActiveRecord::Schema.define(version: 2019_01_20_193707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offices", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "alias"
    t.string "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_name"
  end

  create_table "services", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id"
    t.bigint "office_id"
    t.integer "status", default: 0
    t.money "fare", scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_name"
    t.text "work_requested"
    t.text "work_done"
    t.string "ticket_no"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "contact_no"
    t.index ["office_id"], name: "index_services_on_office_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "mobile", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.text "authentication_token"
    t.datetime "authentication_token_created_at"
    t.integer "service_status"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "services", "offices"
  add_foreign_key "services", "users"
end
