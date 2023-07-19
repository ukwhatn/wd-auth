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

ActiveRecord::Schema[7.0].define(version: 2023_07_19_044614) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.string "scopes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_access_tokens_on_client_id"
    t.index ["user_id"], name: "index_access_tokens_on_user_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "client_admin_access_logs", force: :cascade do |t|
    t.bigint "client_admin_id", null: false
    t.integer "action", null: false
    t.string "ip", null: false
    t.string "user_agent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_admin_id"], name: "index_client_admin_access_logs_on_client_admin_id"
  end

  create_table "client_admins", force: :cascade do |t|
    t.bigint "google_user_id"
    t.bigint "discord_user_id"
    t.bigint "github_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discord_user_id"], name: "index_client_admins_on_discord_user_id"
    t.index ["github_user_id"], name: "index_client_admins_on_github_user_id"
    t.index ["google_user_id"], name: "index_client_admins_on_google_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "client_admin_id", null: false
    t.string "uuid", null: false
    t.string "secret", null: false
    t.string "redirect_uri", null: false
    t.boolean "force_pkce", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_admin_id"], name: "index_clients_on_client_admin_id"
    t.index ["uuid"], name: "index_clients_on_uuid", unique: true
  end

  create_table "codes", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.string "code_challenge"
    t.string "scopes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_codes_on_client_id"
    t.index ["user_id"], name: "index_codes_on_user_id"
  end

  create_table "discord_users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_discord_users_on_email"
    t.index ["uid"], name: "index_discord_users_on_uid", unique: true
  end

  create_table "github_users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_github_users_on_email"
    t.index ["uid"], name: "index_github_users_on_uid", unique: true
  end

  create_table "google_users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_google_users_on_email"
    t.index ["uid"], name: "index_google_users_on_uid", unique: true
  end

  create_table "system_admin_access_logs", force: :cascade do |t|
    t.bigint "system_admin_id", null: false
    t.integer "action", null: false
    t.string "ip", null: false
    t.string "user_agent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["system_admin_id"], name: "index_system_admin_access_logs_on_system_admin_id"
  end

  create_table "system_admins", force: :cascade do |t|
    t.bigint "google_user_id"
    t.bigint "discord_user_id"
    t.bigint "github_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discord_user_id"], name: "index_system_admins_on_discord_user_id"
    t.index ["github_user_id"], name: "index_system_admins_on_github_user_id"
    t.index ["google_user_id"], name: "index_system_admins_on_google_user_id"
  end

  create_table "user_access_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "action", null: false
    t.string "ip", null: false
    t.string "user_agent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_access_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "google_user_id"
    t.bigint "discord_user_id"
    t.bigint "github_user_id"
    t.bigint "wikidot_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discord_user_id"], name: "index_users_on_discord_user_id"
    t.index ["github_user_id"], name: "index_users_on_github_user_id"
    t.index ["google_user_id"], name: "index_users_on_google_user_id"
    t.index ["wikidot_user_id"], name: "index_users_on_wikidot_user_id"
  end

  create_table "wikidot_users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_wikidot_users_on_uid", unique: true
  end

  add_foreign_key "access_tokens", "clients"
  add_foreign_key "access_tokens", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "client_admin_access_logs", "client_admins"
  add_foreign_key "client_admins", "discord_users"
  add_foreign_key "client_admins", "github_users"
  add_foreign_key "client_admins", "google_users"
  add_foreign_key "clients", "client_admins"
  add_foreign_key "codes", "clients"
  add_foreign_key "codes", "users"
  add_foreign_key "system_admin_access_logs", "system_admins"
  add_foreign_key "system_admins", "discord_users"
  add_foreign_key "system_admins", "github_users"
  add_foreign_key "system_admins", "google_users"
  add_foreign_key "user_access_logs", "users"
  add_foreign_key "users", "discord_users"
  add_foreign_key "users", "github_users"
  add_foreign_key "users", "google_users"
  add_foreign_key "users", "wikidot_users"
end
