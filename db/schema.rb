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

ActiveRecord::Schema.define(version: 20170512163514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "physician_id"
    t.integer  "patient_id"
    t.date     "appointment_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id", using: :btree
    t.index ["physician_id"], name: "index_appointments_on_physician_id", using: :btree
  end

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks_people", id: false, force: :cascade do |t|
    t.integer "bank_id",   null: false
    t.integer "person_id", null: false
    t.index ["bank_id"], name: "index_banks_people_on_bank_id", using: :btree
    t.index ["person_id"], name: "index_banks_people_on_person_id", using: :btree
  end

  create_table "birth_registries", force: :cascade do |t|
    t.string   "place"
    t.date     "registry_date"
    t.integer  "person_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["person_id"], name: "index_birth_registries_on_person_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_employees_on_manager_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "text"
    t.string   "notificable_type"
    t.integer  "notificable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["notificable_type", "notificable_id"], name: "index_notifications_on_notificable_type_and_notificable_id", using: :btree
  end

  create_table "paragraphs", force: :cascade do |t|
    t.text     "text"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_paragraphs_on_section_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.date     "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.integer  "kind"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_pets_on_person_id", using: :btree
  end

  create_table "physicians", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.integer  "document_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "highlight",   default: false
    t.index ["document_id"], name: "index_sections_on_document_id", using: :btree
  end

  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "physicians"
  add_foreign_key "birth_registries", "people"
  add_foreign_key "paragraphs", "sections"
  add_foreign_key "pets", "people"
  add_foreign_key "sections", "documents"
end
