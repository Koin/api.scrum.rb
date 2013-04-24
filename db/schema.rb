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

ActiveRecord::Schema.define(version: 20130424195026) do

  create_table "products", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sprint_backlogs", force: true do |t|
    t.integer  "sprint_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sprint_backlogs", ["sprint_id"], name: "index_sprint_backlogs_on_sprint_id"
  add_index "sprint_backlogs", ["story_id"], name: "index_sprint_backlogs_on_story_id"

  create_table "sprints", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "state"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sprints", ["product_id"], name: "index_sprints_on_product_id"

  create_table "stories", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.float    "point"
    t.float    "functional_point"
    t.integer  "state"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["product_id"], name: "index_stories_on_product_id"

end
