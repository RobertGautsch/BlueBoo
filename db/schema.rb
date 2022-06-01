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

ActiveRecord::Schema[7.0].define(version: 2022_05_31_145022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.bigint "questions_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questions_id"], name: "index_answers_on_questions_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_assessments_on_users_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.string "image"
    t.bigint "assessments_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessments_id"], name: "index_questions_on_assessments_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.string "topic"
    t.string "reading_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "answers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answers_id"], name: "index_suggestions_on_answers_id"
  end

  create_table "user_activities", force: :cascade do |t|
    t.bigint "activities_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activities_id"], name: "index_user_activities_on_activities_id"
    t.index ["users_id"], name: "index_user_activities_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions", column: "questions_id"
  add_foreign_key "assessments", "users", column: "users_id"
  add_foreign_key "questions", "assessments", column: "assessments_id"
  add_foreign_key "suggestions", "answers", column: "answers_id"
  add_foreign_key "user_activities", "activities", column: "activities_id"
  add_foreign_key "user_activities", "users", column: "users_id"
end
