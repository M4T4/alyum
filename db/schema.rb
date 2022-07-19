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

ActiveRecord::Schema[7.0].define(version: 2022_07_19_002102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bibliographic_files", force: :cascade do |t|
    t.string "language_y"
    t.string "language_y2"
    t.string "researcher_first_name"
    t.string "researcher_last_name"
    t.string "gender"
    t.integer "year"
    t.string "ms"
    t.string "title"
    t.string "journal_bookname"
    t.string "editor_record"
    t.string "volume"
    t.string "volume_number"
    t.string "publisher"
    t.string "city_country"
    t.string "isbn"
    t.string "issn"
    t.string "doi"
    t.integer "document_type"
    t.string "document_language"
    t.string "country"
    t.string "acces_link"
    t.boolean "free_lock"
    t.string "n1"
    t.string "n2"
    t.integer "page_number"
    t.string "base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "b_data"
  end

  create_table "researchers", force: :cascade do |t|
    t.string "academic_description", default: "", null: false
    t.integer "main_language", default: 0, null: false
    t.integer "main_language_level", default: 0, null: false
    t.string "contact_email", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_researchers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "researchers", "users"
end
