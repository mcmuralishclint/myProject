# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_18_151625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "vertical_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0
    t.index ["name"], name: "index_categories_on_name"
    t.index ["vertical_id"], name: "index_categories_on_vertical_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0
    t.index ["author"], name: "index_courses_on_author"
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["name"], name: "index_courses_on_name"
  end

  create_table "verticals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_verticals_on_name"
  end

  add_foreign_key "categories", "verticals"
  add_foreign_key "courses", "categories"
end
