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

ActiveRecord::Schema.define(version: 20171121034843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "jet_id"
    t.string   "origin"
    t.string   "destination"
    t.datetime "departure"
    t.datetime "arrival"
    t.integer  "price"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["jet_id"], name: "index_flights_on_jet_id", using: :btree
    t.index ["user_id"], name: "index_flights_on_user_id", using: :btree
  end

  create_table "jets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "plane_model"
    t.integer  "seat_number"
    t.integer  "production_year"
    t.string   "wifi"
    t.string   "meal"
    t.string   "img_url"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_jets_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "ambiance_rating"
    t.integer  "service_rating"
    t.string   "description"
    t.string   "img_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["flight_id"], name: "index_reviews_on_flight_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone"
    t.boolean  "jet_owner"
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "flights", "jets"
  add_foreign_key "flights", "users"
  add_foreign_key "jets", "users"
  add_foreign_key "reviews", "flights"
end
