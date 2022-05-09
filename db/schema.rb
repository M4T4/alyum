# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_509_202_217) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bibliographic_files', force: :cascade do |t|
    t.string 'language_y'
    t.string 'language_y2'
    t.string 'researcher_first_name'
    t.string 'researcher_last_name'
    t.string 'gender'
    t.integer 'year'
    t.string 'ms'
    t.string 'title'
    t.string 'journal_bookname'
    t.string 'editor_record'
    t.string 'volume'
    t.string 'volume_number'
    t.string 'publisher'
    t.string 'city_country'
    t.string 'isbn'
    t.string 'issn'
    t.string 'doi'
    t.integer 'document_type'
    t.string 'document_language'
    t.string 'country'
    t.string 'acces_link'
    t.boolean 'free_lock'
    t.integer 'n1'
    t.integer 'n2'
    t.integer 'page_number'
    t.string 'base'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'books', force: :cascade do |t|
    t.bigint 'isbn'
    t.string 'name'
    t.string 'author'
    t.integer 'year'
    t.decimal 'price', precision: 7, scale: 2
    t.boolean 'status'
    t.integer 'genre'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
