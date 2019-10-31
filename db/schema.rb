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

ActiveRecord::Schema.define(version: 20191031202123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_users", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "user_id"
    t.string "privilege"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_users_on_account_id"
    t.index ["user_id"], name: "index_account_users_on_user_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "account_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_categories_on_account_id"
  end

  create_table "group_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_group_categories_on_category_id"
    t.index ["group_id"], name: "index_group_categories_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_groups_on_account_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "location"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_suppliers_on_account_id"
  end

  create_table "transaction_headers", force: :cascade do |t|
    t.bigint "user_id"
    t.date "transaction_date"
    t.bigint "account_id"
    t.bigint "supplier_id"
    t.string "sign"
    t.date "reconciled"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transaction_headers_on_account_id"
    t.index ["supplier_id"], name: "index_transaction_headers_on_supplier_id"
    t.index ["user_id"], name: "index_transaction_headers_on_user_id"
  end

  create_table "transaction_items", force: :cascade do |t|
    t.bigint "category_id"
    t.decimal "amount"
    t.string "description"
    t.bigint "transaction_header_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_transaction_items_on_category_id"
    t.index ["transaction_header_id"], name: "index_transaction_items_on_transaction_header_id"
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

  add_foreign_key "account_users", "accounts"
  add_foreign_key "account_users", "users"
  add_foreign_key "accounts", "users"
  add_foreign_key "categories", "accounts"
  add_foreign_key "group_categories", "categories"
  add_foreign_key "group_categories", "groups"
  add_foreign_key "groups", "accounts"
  add_foreign_key "suppliers", "accounts"
  add_foreign_key "transaction_headers", "accounts"
  add_foreign_key "transaction_headers", "suppliers"
  add_foreign_key "transaction_headers", "users"
  add_foreign_key "transaction_items", "categories"
  add_foreign_key "transaction_items", "transaction_headers"
end
