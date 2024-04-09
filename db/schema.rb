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

ActiveRecord::Schema[7.1].define(version: 2024_04_09_104555) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "plans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "plan_type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
  end

  create_table "portfolio_interests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "interest", default: "0.0"
    t.uuid "portfolio_id", null: false
    t.boolean "widthdrawn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_portfolio_interests_on_portfolio_id"
  end

  create_table "portfolios", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "amount"
    t.uuid "user_id", null: false
    t.uuid "plan_id", null: false
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_portfolios_on_plan_id"
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "amount"
    t.integer "transaction_type"
    t.integer "status"
    t.string "address"
    t.integer "coin_type"
    t.uuid "wallet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_transactions_on_wallet_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_no"
    t.string "email"
    t.integer "role", default: 0
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
  end

  create_table "wallets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "balance"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "portfolio_interests", "portfolios"
  add_foreign_key "portfolios", "plans"
  add_foreign_key "portfolios", "users"
  add_foreign_key "transactions", "wallets"
  add_foreign_key "wallets", "users"
end
