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

ActiveRecord::Schema.define(version: 20140105174347) do

  create_table "albums", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.text     "side_content"
    t.string   "browser_title"
    t.string   "menu_title"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.boolean  "display_in_menu",  default: true, null: false
    t.boolean  "draft",            default: true, null: false
    t.string   "parent_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["parent_page_id"], name: "index_pages_on_parent_page_id", using: :btree
  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "photos", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.integer  "album_id"
    t.boolean  "featured",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.boolean  "featured",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
