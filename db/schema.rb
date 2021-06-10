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

ActiveRecord::Schema.define(version: 2021_06_09_113154) do

  create_table "favorite_recipes", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.string "dosage"
    t.string "difficulty"
    t.string "preparation"
    t.text "ingredients"
    t.text "steps"
    t.string "image"
    t.integer "video_id"
    t.string "link"
    t.text "image_data"
    t.integer "user_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
    t.index ["video_id"], name: "index_recipes_on_video_id"
  end

# Could not dump table "reviews" because of following StandardError
#   Unknown type 'reference' for column 'user_id'

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "roles_mask"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "link"
    t.string "title"
    t.string "uid"
    t.integer "recipe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_videos_on_uid"
  end

  add_foreign_key "recipes", "videos"
  add_foreign_key "reviews", "recipes"
end
