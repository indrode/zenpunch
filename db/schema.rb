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

ActiveRecord::Schema.define(version: 20150702101016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "datestamp"
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.integer  "number"
    t.integer  "steps"
    t.float    "distance"
    t.integer  "calories"
    t.integer  "sedentary_minutes"
    t.integer  "active_minutes"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "fs_features", force: :cascade do |t|
    t.string   "key"
    t.boolean  "enabled",    default: false
    t.string   "klass"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "fs_settings", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.string   "value_type"
    t.string   "klass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
