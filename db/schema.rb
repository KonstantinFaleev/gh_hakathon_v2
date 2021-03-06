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

ActiveRecord::Schema.define(version: 2018_04_22_202915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "site_entries", force: :cascade do |t|
    t.string "link"
    t.string "header"
    t.string "content"
    t.string "img"
    t.bigint "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link"], name: "index_site_entries_on_link", unique: true
    t.index ["site_id"], name: "index_site_entries_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "main_url"
    t.string "entry_list_tag"
    t.string "entry_tag"
    t.string "header_tag"
    t.string "content_tag"
    t.string "name"
    t.string "img_tag"
    t.string "img_attr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sites_on_name", unique: true
  end

  add_foreign_key "site_entries", "sites"
end
