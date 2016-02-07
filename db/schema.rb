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

ActiveRecord::Schema.define(version: 20160206194216) do

  create_table "bassists", force: :cascade do |t|
    t.boolean "five_string", default: false, null: false
    t.boolean "six_string",  default: false, null: false
  end

  create_table "drummers", force: :cascade do |t|
    t.boolean "double_kick", default: false, null: false
  end

  create_table "guitarists", force: :cascade do |t|
    t.string "rhythm_or_lead", limit: 255, null: false
  end

  create_table "musicians", force: :cascade do |t|
    t.boolean  "background_vocals",             default: false
    t.integer  "experience",        limit: 4,   default: 0
    t.string   "proficiency",       limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "user_id",           limit: 4,                   null: false
    t.integer  "actable_id",        limit: 4
    t.string   "actable_type",      limit: 255
  end

  add_index "musicians", ["actable_type", "actable_id"], name: "index_musicians_on_actable_type_and_actable_id", using: :btree
  add_index "musicians", ["user_id"], name: "index_musicians_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",          limit: 4,     null: false
    t.text     "review",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "reviewable_id",   limit: 4,     null: false
    t.string   "reviewable_type", limit: 255,   null: false
  end

  add_index "reviews", ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "singers", force: :cascade do |t|
    t.string "range", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255, null: false
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "city",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
