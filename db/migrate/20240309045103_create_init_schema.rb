class CreateInitSchema < ActiveRecord::Migration[7.0]
  def change

    ActiveRecord::Schema[7.0].define(version: 2024_02_29_163238) do
      create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.string "name", null: false
        t.string "record_type", null: false
        t.bigint "record_id", null: false
        t.bigint "blob_id", null: false
        t.datetime "created_at", null: false
        t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
        t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
      end

      create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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

      create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.bigint "blob_id", null: false
        t.string "variation_digest", null: false
        t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
      end

      create_table "admin_dashboards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.string "title"
        t.text "content"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.string "name"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "lists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.string "title"
        t.text "description"
        t.string "category"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "sites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.bigint "user_id", null: false
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.string "name"
        t.text "description"
        t.index ["user_id"], name: "index_sites_on_user_id"
      end

      create_table "social_links", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.bigint "user_id", null: false
        t.string "name"
        t.string "url"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["user_id"], name: "index_social_links_on_user_id"
      end

      create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.string "email", default: "", null: false
        t.string "encrypted_password", default: "", null: false
        t.string "reset_password_token"
        t.datetime "reset_password_sent_at"
        t.datetime "remember_created_at"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.boolean "admin", default: false
        t.string "name"
        t.text "biography"
        t.index ["email"], name: "index_users_on_email", unique: true
        t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
      end

      create_table "words", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.text "content"
        t.string "speaker"
        t.text "source"
        t.text "memo"
        t.datetime "date"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
      add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
      add_foreign_key "sites", "users"
      add_foreign_key "social_links", "users"
    end

  end
end
