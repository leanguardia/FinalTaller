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






ActiveRecord::Schema.define(version: 20150510193117) do

  create_table "band_types", force: true do |t|
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bands", force: true do |t|
    t.string   "color"
    t.integer  "user_id"
    t.integer  "Band_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bands", ["Band_type_id"], name: "index_bands_on_Band_type_id"
  add_index "bands", ["user_id"], name: "index_bands_on_user_id"

  create_table "goal_types", force: true do |t|
    t.string   "typename"
    t.string   "unit_measured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "target"
    t.float    "reached"
    t.integer  "goal_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["goal_type_id"], name: "index_goals_on_goal_type_id"
  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "lastname"
    t.string   "sex"
    t.float    "weight"
    t.float    "height"
    t.date     "birthdate"
    t.string   "rol"
    t.boolean  "active"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
