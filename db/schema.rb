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

ActiveRecord::Schema.define(version: 2022_02_09_154330) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "actors", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_actors_on_name", unique: true
  end

  create_table "directors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "photo", default: "", null: false
    t.index ["first_name", "last_name"], name: "index_directors_on_first_name_and_last_name", unique: true
  end

  create_table "film_actors", force: :cascade do |t|
    t.bigint "actor_id", null: false
    t.bigint "film_id", null: false
    t.index ["actor_id"], name: "index_film_actors_on_actor_id"
    t.index ["film_id", "actor_id"], name: "index_film_actors_on_film_id_and_actor_id", unique: true
    t.index ["film_id"], name: "index_film_actors_on_film_id"
  end

  create_table "film_genres", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "film_id", null: false
    t.index ["film_id"], name: "index_film_genres_on_film_id"
    t.index ["genre_id"], name: "index_film_genres_on_genre_id"
  end

  create_table "film_producers", force: :cascade do |t|
    t.bigint "producer_id", null: false
    t.bigint "film_id", null: false
    t.index ["film_id", "producer_id"], name: "index_film_producers_on_film_id_and_producer_id", unique: true
    t.index ["film_id"], name: "index_film_producers_on_film_id"
    t.index ["producer_id"], name: "index_film_producers_on_producer_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "name", null: false
    t.integer "budget"
    t.integer "gather"
    t.text "description", null: false
    t.string "poster"
    t.string "imdb"
    t.string "limit", default: "18+", null: false
    t.bigint "director_id"
    t.index ["director_id"], name: "index_films_on_director_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "producers", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_producers_on_name", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description", default: "", null: false
    t.integer "rating", default: 5, null: false
    t.bigint "film_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id", "user_id"], name: "index_reviews_on_film_id_and_user_id", unique: true
    t.index ["film_id"], name: "index_reviews_on_film_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0, null: false
    t.datetime "blocked_at", precision: 6
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "film_actors", "actors"
  add_foreign_key "film_actors", "films"
  add_foreign_key "film_genres", "films"
  add_foreign_key "film_genres", "genres"
  add_foreign_key "film_producers", "films"
  add_foreign_key "film_producers", "producers"
  add_foreign_key "films", "directors"
  add_foreign_key "reviews", "films"
  add_foreign_key "reviews", "users"
end
