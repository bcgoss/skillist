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

ActiveRecord::Schema.define(version: 20161103132739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.integer  "jobkey"
    t.date     "post_date"
    t.string   "company"
    t.integer  "location_id"
    t.string   "snippet"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_jobs_on_location_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "formatted_location_full"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "query"
    t.integer  "location_id"
    t.date     "last_check"
    t.integer  "hits"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_searches_on_location_id", using: :btree
  end

  create_table "terms", force: :cascade do |t|
    t.string   "keyword"
    t.date     "last_check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "jobs", "locations"
  add_foreign_key "searches", "locations"
end
