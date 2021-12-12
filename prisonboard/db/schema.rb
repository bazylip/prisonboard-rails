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

ActiveRecord::Schema.define(version: 2021_12_12_204140) do

  create_table "companies", force: :cascade do |t|
    t.string "address"
    t.string "full_name"
    t.string "short_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employments", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "inmate_id", null: false
    t.integer "job_offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inmate_id"], name: "index_employments_on_inmate_id"
    t.index ["job_offer_id"], name: "index_employments_on_job_offer_id"
  end

  create_table "inmates", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "pesel"
    t.float "average_rating"
    t.boolean "hired"
    t.date "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_offers", force: :cascade do |t|
    t.string "job_title"
    t.float "hourly_rate"
    t.integer "weekly_hours"
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_job_offers_on_company_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "skill"
    t.integer "level"
    t.integer "inmate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inmate_id"], name: "index_qualifications_on_inmate_id"
  end

  create_table "system_users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "employments", "inmates"
  add_foreign_key "employments", "job_offers"
  add_foreign_key "job_offers", "companies"
  add_foreign_key "qualifications", "inmates"
end
