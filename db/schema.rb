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

ActiveRecord::Schema.define(version: 20140821211557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "commentator"
    t.string   "email"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.text     "comment"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "email"
    t.string   "ip"
    t.binary   "image"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.boolean  "admin"
    t.string   "email"
    t.string   "ip"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
