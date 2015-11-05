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

ActiveRecord::Schema.define(version: 20151105184049) do

  create_table "nutrition_food_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutrition_foods", force: :cascade do |t|
    t.integer  "food_group_id"
    t.text     "description"
    t.string   "summary"
    t.text     "aliases"
    t.string   "manufacturer"
    t.boolean  "is_complete"
    t.string   "waste_description"
    t.integer  "waste_yield"
    t.string   "origin"
    t.decimal  "nitrogen_protein_yield"
    t.decimal  "protein_calorie_yield"
    t.decimal  "fat_calorie_yield"
    t.decimal  "carb_calorie_yield"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "nutrition_foods", ["food_group_id"], name: "index_nutrition_foods_on_food_group_id"

  create_table "nutrition_langual_factors", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "nutrition_nutrients", force: :cascade do |t|
    t.string   "unit"
    t.string   "label"
    t.text     "name"
    t.integer  "significant_figures"
    t.integer  "position"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
