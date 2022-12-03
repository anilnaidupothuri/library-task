# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_03_121313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigned_books", force: :cascade do |t|
    t.string "Book_Name"
    t.string "Student_Name"
    t.bigint "student_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.boolean "assigned"
    t.index ["book_id"], name: "index_assigned_books_on_book_id"
    t.index ["student_id"], name: "index_assigned_books_on_student_id"
    t.index ["user_id"], name: "index_assigned_books_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "writter"
    t.integer "pages"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "study"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "assigned_books", "books"
  add_foreign_key "assigned_books", "students"
  add_foreign_key "assigned_books", "users"
  add_foreign_key "books", "users"
  add_foreign_key "students", "users"
end
