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

ActiveRecord::Schema.define(version: 2018_11_14_185530) do

  create_table "applicant_jobs", force: :cascade do |t|
    t.integer "applicant_id"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.binary "resume"
    t.string "gpa"
    t.string "education_info"
    t.string "application_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_jobs", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.boolean "admin"
    t.binary "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "applicant_id"
    t.integer "question_id"
    t.integer "score"
    t.integer "comparison_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
