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

ActiveRecord::Schema.define(version: 20161213100445) do

  create_table "cards", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.datetime "deleted_at"
  end

  add_index "cards", ["deleted_at"], name: "index_cards_on_deleted_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "firstname",        limit: 255
    t.string   "lastname",         limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "password_digest",  limit: 255
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "email",            limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
  end

end
