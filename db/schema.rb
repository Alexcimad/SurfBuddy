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

ActiveRecord::Schema.define(version: 2022_04_28_215105) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "favorite_spot_tags", force: :cascade do |t|
    t.bigint "favorite_spot_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favorite_spot_id"], name: "index_favorite_spot_tags_on_favorite_spot_id"
    t.index ["tag_id"], name: "index_favorite_spot_tags_on_tag_id"
  end

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
    t.datetime "start_hour"
    t.datetime "end_hour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "wave"
    t.integer "temp"
    t.integer "wind_speed"
    t.string "wind_direction"
    t.integer "rating"
    t.index ["surf_spot_id"], name: "index_surf_conditions_on_surf_spot_id"
  end

  create_table "surf_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "surf_condition_id", null: false
    t.index ["surf_condition_id"], name: "index_surf_sessions_on_surf_condition_id"
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

  create_table "tags", force: :cascade do |t|
    t.string "name"
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
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorite_spot_tags", "favorite_spots"
  add_foreign_key "favorite_spot_tags", "tags"
  add_foreign_key "favorite_spots", "surf_spots"
  add_foreign_key "favorite_spots", "users"
  add_foreign_key "spot_reviews", "surf_spots"
  add_foreign_key "spot_reviews", "users"
  add_foreign_key "surf_conditions", "surf_spots"
  add_foreign_key "surf_sessions", "surf_conditions"
  add_foreign_key "surf_sessions", "users"
end
