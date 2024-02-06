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

ActiveRecord::Schema[7.0].define(version: 2024_02_06_090649) do
  create_table "test_case_tags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_case_tags_cases", id: false, force: :cascade do |t|
    t.integer "test_case_id", null: false
    t.integer "test_case_tag_id", null: false
    t.index ["test_case_id", "test_case_tag_id"], name: "index_test_case_tags_cases_on_test_case_id_and_test_case_tag_id"
    t.index ["test_case_tag_id", "test_case_id"], name: "index_test_case_tags_cases_on_test_case_tag_id_and_test_case_id"
  end

  create_table "test_cases", force: :cascade do |t|
    t.string "name"
    t.text "steps"
    t.boolean "to_test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
