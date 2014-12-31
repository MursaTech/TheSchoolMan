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

ActiveRecord::Schema.define(version: 20141231105422) do

  create_table "accounts", force: true do |t|
    t.string   "email"
    t.boolean  "setup",              default: false
    t.boolean  "boolean",            default: false
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "attendance_sheets", force: true do |t|
    t.integer  "student_id"
    t.integer  "user_id"
    t.integer  "stream_id"
    t.boolean  "present",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendance_sheets", ["stream_id"], name: "index_attendance_sheets_on_stream_id"
  add_index "attendance_sheets", ["student_id"], name: "index_attendance_sheets_on_student_id"
  add_index "attendance_sheets", ["user_id"], name: "index_attendance_sheets_on_user_id"

  create_table "discipline_records", force: true do |t|
    t.integer  "student_id"
    t.string   "offense"
    t.string   "punishment"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discipline_records", ["student_id"], name: "index_discipline_records_on_student_id"

  create_table "exam_results", force: true do |t|
    t.integer  "stream_id"
    t.integer  "exam_id"
    t.integer  "student_id"
    t.integer  "subject_id"
    t.string   "score"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_results", ["exam_id"], name: "index_exam_results_on_exam_id"
  add_index "exam_results", ["stream_id"], name: "index_exam_results_on_stream_id"
  add_index "exam_results", ["student_id"], name: "index_exam_results_on_student_id"
  add_index "exam_results", ["subject_id"], name: "index_exam_results_on_subject_id"

  create_table "exams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guardians", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "id_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "health_records", force: true do |t|
    t.integer  "student_id"
    t.text     "diagonosis"
    t.string   "prescription"
    t.boolean  "need_for_outside_referral"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "health_records", ["student_id"], name: "index_health_records_on_student_id"
  add_index "health_records", ["user_id"], name: "index_health_records_on_user_id"

  create_table "streams", force: true do |t|
    t.string   "name"
    t.integer  "form_id"
    t.integer  "user_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "streams", ["form_id"], name: "index_streams_on_form_id"
  add_index "streams", ["student_id"], name: "index_streams_on_student_id"
  add_index "streams", ["user_id"], name: "index_streams_on_user_id"

  create_table "students", force: true do |t|
    t.string   "name"
    t.datetime "dob"
    t.string   "admission_number"
    t.integer  "account_id"
    t.integer  "guardian_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "stream_id"
    t.string   "previous_school"
    t.string   "last_exam_score"
    t.string   "gender"
  end

  add_index "students", ["account_id"], name: "index_students_on_account_id"
  add_index "students", ["guardian_id"], name: "index_students_on_guardian_id"
  add_index "students", ["stream_id"], name: "index_students_on_stream_id"

  create_table "subject_allocations", force: true do |t|
    t.integer  "stream_id"
    t.integer  "subject_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_allocations", ["stream_id"], name: "index_subject_allocations_on_stream_id"
  add_index "subject_allocations", ["subject_id"], name: "index_subject_allocations_on_subject_id"
  add_index "subject_allocations", ["user_id"], name: "index_subject_allocations_on_user_id"

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_accounts", force: true do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.boolean  "is_preferred", default: false
    t.boolean  "boolean",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_accounts", ["account_id"], name: "index_user_accounts_on_account_id"
  add_index "user_accounts", ["user_id"], name: "index_user_accounts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
