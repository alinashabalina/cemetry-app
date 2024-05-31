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

ActiveRecord::Schema[7.1].define(version: 2024_05_31_131411) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "title"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "details"
  end

  create_table "graveyards", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "details"
    t.index ["city_id"], name: "index_graveyards_on_city_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bio"
    t.string "photo"
    t.string "social_1"
    t.string "social_2"
    t.string "social_3"
    t.index ["city_id"], name: "index_guides_on_city_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "title"
    t.bigint "guide_id", null: false
    t.bigint "graveyard_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_tours_on_city_id"
    t.index ["graveyard_id"], name: "index_tours_on_graveyard_id"
    t.index ["guide_id"], name: "index_tours_on_guide_id"
  end

  create_table "users", force: :cascade do |t|
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

  add_foreign_key "graveyards", "cities"
  add_foreign_key "guides", "cities"
  add_foreign_key "tours", "cities"
  add_foreign_key "tours", "graveyards"
  add_foreign_key "tours", "guides"
end
