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

ActiveRecord::Schema.define(version: 20150606001932) do

  create_table "alarms", force: true do |t|
    t.integer  "user_id"
    t.string   "day_week"
    t.datetime "alarm_hour"
    t.boolean  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "band_data", force: true do |t|
    t.integer  "user_id"
    t.integer  "band_id"
    t.datetime "date_sent"
    t.integer  "steps_taken"
    t.integer  "calories_burnt"
    t.integer  "heart_rate_pminute"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "band_data", ["band_id"], name: "index_band_data_on_band_id"
  add_index "band_data", ["user_id"], name: "index_band_data_on_user_id"

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
    t.integer  "interval"
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
    t.string   "name"
    t.string   "lastname"
    t.string   "sex"
    t.float    "weight"
    t.float    "height"
    t.date     "birthdate"
    t.string   "role"
    t.boolean  "active"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workout_types", force: true do |t|
    t.string   "typename"
    t.boolean  "outside"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "workout_type_id"
    t.datetime "start"
    t.datetime "end"
    t.integer  "calories"
    t.integer  "heartrate"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id"
  add_index "workouts", ["workout_type_id"], name: "index_workouts_on_workout_type_id"

end
