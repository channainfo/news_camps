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

ActiveRecord::Schema.define(version: 20150813124140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "site_contents", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.string   "description"
    t.string   "content"
    t.string   "keywords"
    t.string   "media"
    t.string   "icon"
    t.integer  "site_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "images",      default: [],              array: true
  end

  add_index "site_contents", ["site_id"], name: "index_site_contents_on_site_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "url"
    t.string   "pattern"
    t.string   "featured_pattern"
    t.integer  "score"
    t.string   "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_pattern"
    t.string   "by_author_pattern"
    t.string   "published_at_pattern"
    t.string   "header_pattern"
    t.string   "article_pattern"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "username_lower"
    t.inet     "ip_address"
    t.inet     "registration_ip_address"
    t.string   "locale"
    t.string   "password_digest"
    t.string   "auth_token"
    t.boolean  "admin"
    t.boolean  "approved"
    t.datetime "approved_at"
    t.boolean  "blocked"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
