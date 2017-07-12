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

ActiveRecord::Schema.define(version: 20170712181515) do

  create_table "centers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "phone"
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "region"
  end

  create_table "cycles", force: :cascade do |t|
    t.string   "name"
    t.date     "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "eje_id"
  end

  add_index "divisions", ["eje_id"], name: "index_divisions_on_eje_id"

  create_table "doctors", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "speciality"
    t.string   "suite"
    t.string   "phone_ext"
    t.string   "email"
    t.date     "birthday"
    t.integer  "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  add_index "doctors", ["center_id"], name: "index_doctors_on_center_id"

  create_table "drugstores", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "service_person"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ejes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.boolean  "visited"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plannings", force: :cascade do |t|
    t.string   "title"
    t.date     "date_visit"
    t.string   "shift"
    t.boolean  "visited"
    t.text     "note"
    t.integer  "user_id"
    t.integer  "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cycle_id"
  end

  add_index "plannings", ["cycle_id"], name: "index_plannings_on_cycle_id"
  add_index "plannings", ["doctor_id"], name: "index_plannings_on_doctor_id"
  add_index "plannings", ["user_id"], name: "index_plannings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username"
    t.boolean  "admin"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "division_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["division_id"], name: "index_users_on_division_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
