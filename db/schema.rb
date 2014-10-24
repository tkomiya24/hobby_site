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

ActiveRecord::Schema.define(version: 20141024163142) do

  create_table "bassists", force: true do |t|
    t.boolean  "background_vocals", default: false, null: false
    t.boolean  "five_string",       default: false, null: false
    t.boolean  "six_string",        default: false, null: false
    t.integer  "experience",        default: 0,     null: false
    t.integer  "rating",            default: 0
    t.string   "proficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drummers", force: true do |t|
    t.boolean  "background_vocals", default: false, null: false
    t.boolean  "double_kick",       default: false, null: false
    t.integer  "experience",        default: 0,     null: false
    t.integer  "rating",            default: 0
    t.string   "proficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guitarists", force: true do |t|
    t.boolean  "background_vocals", default: false, null: false
    t.string   "rhythm_or_lead",                    null: false
    t.integer  "experience",        default: 0,     null: false
    t.integer  "rating",            default: 0
    t.string   "proficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "singers", force: true do |t|
    t.boolean  "background_vocals", default: false, null: false
    t.string   "range"
    t.integer  "experience",        default: 0,     null: false
    t.integer  "rating",            default: 0
    t.string   "proficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.integer  "drummer_id"
    t.integer  "guitarist_id"
    t.integer  "bassist_id"
    t.integer  "singer_id"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
