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

ActiveRecord::Schema.define(version: 2021_05_10_155933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_histories", force: :cascade do |t|
    t.string "content"
    t.string "action"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_action_histories_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "phone"
    t.string "address"
    t.text "image"
    t.bigint "user_id"
    t.bigint "lab_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lab_id"], name: "index_doctors_on_lab_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "lab_tests", force: :cascade do |t|
    t.boolean "active"
    t.boolean "is_lab_price"
    t.integer "lab_price"
    t.integer "lab_tax"
    t.bigint "raw_test_id", null: false
    t.bigint "lab_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lab_id"], name: "index_lab_tests_on_lab_id"
    t.index ["raw_test_id"], name: "index_lab_tests_on_raw_test_id"
  end

  create_table "labs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "phone"
    t.string "address"
    t.text "image"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_labs_on_user_id"
  end

  create_table "raw_tests", force: :cascade do |t|
    t.string "name"
    t.string "note"
    t.integer "cost"
    t.integer "tax"
    t.bigint "test_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["test_type_id"], name: "index_raw_tests_on_test_type_id"
  end

  create_table "result_tests", force: :cascade do |t|
    t.string "note"
    t.string "image"
    t.string "file"
    t.string "result"
    t.integer "cost"
    t.integer "type"
    t.string "performer"
    t.integer "result_status"
    t.bigint "user_test_id", null: false
    t.bigint "lab_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lab_test_id"], name: "index_result_tests_on_lab_test_id"
    t.index ["user_test_id"], name: "index_result_tests_on_user_test_id"
  end

  create_table "test_types", force: :cascade do |t|
    t.string "vi_name"
    t.string "en_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_tests", force: :cascade do |t|
    t.string "note"
    t.string "image"
    t.string "address"
    t.string "phone"
    t.string "reason"
    t.integer "total"
    t.integer "type"
    t.integer "test_status"
    t.bigint "doctor_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_user_tests_on_doctor_id"
    t.index ["user_id"], name: "index_user_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "role", default: 0
    t.string "postion"
    t.string "phone"
    t.string "address"
    t.string "image"
    t.integer "lab_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "action_histories", "users"
  add_foreign_key "doctors", "labs"
  add_foreign_key "doctors", "users"
  add_foreign_key "lab_tests", "labs"
  add_foreign_key "lab_tests", "raw_tests"
  add_foreign_key "labs", "users"
  add_foreign_key "raw_tests", "test_types"
  add_foreign_key "result_tests", "lab_tests"
  add_foreign_key "result_tests", "user_tests"
  add_foreign_key "user_tests", "users"
  add_foreign_key "user_tests", "users", column: "doctor_id"
end
