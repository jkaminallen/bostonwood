# frozen_string_literal: true
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

ActiveRecord::Schema.define(version: 20161105201400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builders", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "blurb"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name",        null: false
    t.string "blurb"
    t.text   "description"
  end

  create_table "products", force: :cascade do |t|
    t.string  "name",           null: false
    t.string  "blurb"
    t.text    "description"
    t.string  "build_material", null: false
    t.integer "category_id",    null: false
    t.integer "builder_id",     null: false
    t.string  "image"
    t.index ["builder_id"], name: "index_products_on_builder_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

end
