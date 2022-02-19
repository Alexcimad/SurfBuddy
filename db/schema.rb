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

ActiveRecord::Schema.define(version: 2022_02_17_191921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_spots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "surf_spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["surf_spot_id"], name: "index_favorite_spots_on_surf_spot_id"
    t.index ["user_id"], name: "index_favorite_spots_on_user_id"
  end

  create_table "spot_reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "surf_spot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["surf_spot_id"], name: "index_spot_reviews_on_surf_spot_id"
    t.index ["user_id"], name: "index_spot_reviews_on_user_id"
  end

  create_table "surf_conditions", force: :cascade do |t|
    t.string "level"
    t.float "swell"
    t.integer "period"
    t.integer "water_temp"
    t.bigint "surf_spot_id", null: false
    t.date "start_hour"
    t.date "end_hour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["surf_spot_id"], name: "index_surf_conditions_on_surf_spot_id"
  end

  create_table "surf_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "surf_spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["surf_spot_id"], name: "index_surf_sessions_on_surf_spot_id"
    t.index ["user_id"], name: "index_surf_sessions_on_user_id"
  end

  create_table "surf_spots", force: :cascade do |t|
    t.string "location"
    t.text "description"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.string "level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorite_spots", "surf_spots"
  add_foreign_key "favorite_spots", "users"
  add_foreign_key "spot_reviews", "surf_spots"
  add_foreign_key "spot_reviews", "users"
  add_foreign_key "surf_conditions", "surf_spots"
  add_foreign_key "surf_sessions", "surf_spots"
  add_foreign_key "surf_sessions", "users"
end
