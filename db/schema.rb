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

ActiveRecord::Schema[7.0].define(version: 2023_04_13_053709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "dish_genre_tags", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "genre_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id", "genre_tag_id"], name: "index_dish_genre_tags_on_dish_id_and_genre_tag_id", unique: true
    t.index ["dish_id"], name: "index_dish_genre_tags_on_dish_id"
    t.index ["genre_tag_id"], name: "index_dish_genre_tags_on_genre_tag_id"
  end

  create_table "dish_ingredient_tags", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "ingredient_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id", "ingredient_tag_id"], name: "index_dish_ingredient_tags_on_dish_id_and_ingredient_tag_id", unique: true
    t.index ["dish_id"], name: "index_dish_ingredient_tags_on_dish_id"
    t.index ["ingredient_tag_id"], name: "index_dish_ingredient_tags_on_ingredient_tag_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genre_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "dish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_menus_on_dish_id"
    t.index ["user_id"], name: "index_menus_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "videos", force: :cascade do |t|
    t.string "video_id", null: false
    t.string "title", null: false
    t.string "thumbnail", null: false
    t.bigint "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_videos_on_dish_id"
  end

  add_foreign_key "dish_genre_tags", "dishes"
  add_foreign_key "dish_genre_tags", "genre_tags"
  add_foreign_key "dish_ingredient_tags", "dishes"
  add_foreign_key "dish_ingredient_tags", "ingredient_tags"
  add_foreign_key "menus", "dishes"
  add_foreign_key "menus", "users"
  add_foreign_key "videos", "dishes"
end
