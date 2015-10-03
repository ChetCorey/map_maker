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

ActiveRecord::Schema.define(version: 20151003080849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "maps", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "subtitle"
    t.jsonb    "meta_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "study_id"
  end

  add_index "maps", ["study_id"], name: "index_maps_on_study_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.string   "fips"
    t.string   "value"
    t.integer  "user_id"
    t.integer  "study_id"
    t.integer  "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "records", ["map_id"], name: "index_records_on_map_id", using: :btree
  add_index "records", ["study_id"], name: "index_records_on_study_id", using: :btree
  add_index "records", ["user_id"], name: "index_records_on_user_id", using: :btree

  create_table "studies", force: :cascade do |t|
    t.string   "title"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "studies", ["project_id"], name: "index_studies_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "maps", "studies"
  add_foreign_key "projects", "users"
  add_foreign_key "records", "maps"
  add_foreign_key "records", "studies"
  add_foreign_key "records", "users"
  add_foreign_key "studies", "projects"
end
