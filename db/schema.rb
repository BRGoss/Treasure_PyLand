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

ActiveRecord::Schema.define(version: 20160428071320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frames", force: :cascade do |t|
    t.integer  "storyboard_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "frame_order"
  end

  add_index "frames", ["storyboard_id"], name: "index_frames_on_storyboard_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "code"
  end

  create_table "parameters", force: :cascade do |t|
    t.string   "input"
    t.string   "output"
    t.integer  "puzzle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parameters", ["puzzle_id"], name: "index_parameters_on_puzzle_id", using: :btree

  create_table "puzzles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "contract"
    t.text     "solution"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "frame_id"
  end

  add_index "puzzles", ["frame_id"], name: "index_puzzles_on_frame_id", using: :btree

  create_table "scenes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "visual"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "transcript"
    t.integer  "frame_id"
  end

  add_index "scenes", ["frame_id"], name: "index_scenes_on_frame_id", using: :btree

  create_table "storyboards", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "default"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "debug_mode"
  end

  add_foreign_key "frames", "storyboards"
  add_foreign_key "parameters", "puzzles"
  add_foreign_key "puzzles", "frames"
  add_foreign_key "scenes", "frames"
end
