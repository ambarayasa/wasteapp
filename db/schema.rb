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

ActiveRecord::Schema[7.0].define(version: 2022_06_22_073131) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "depots", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_details", force: :cascade do |t|
    t.integer "quantity"
    t.float "subtotal"
    t.integer "transaction_id", null: false
    t.integer "waste_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_transaction_details_on_transaction_id"
    t.index ["waste_id"], name: "index_transaction_details_on_waste_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "date"
    t.text "descriptions"
    t.float "total"
    t.integer "user_id", null: false
    t.integer "depot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["depot_id"], name: "index_transactions_on_depot_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "password_digest"
    t.string "email"
    t.string "name"
    t.string "address"
    t.string "gender"
    t.float "balance"
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "wastes", force: :cascade do |t|
    t.string "name"
    t.text "descriptions"
    t.float "price"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_wastes_on_category_id"
  end

  add_foreign_key "transaction_details", "transactions"
  add_foreign_key "transaction_details", "wastes"
  add_foreign_key "transactions", "depots"
  add_foreign_key "transactions", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "wastes", "categories"
end
