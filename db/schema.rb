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

ActiveRecord::Schema.define(version: 20161112235951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "total"
  end

  create_table "deals", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.decimal  "price"
    t.decimal  "total"
    t.integer  "buyer_id"
    t.integer  "seller_id"
  end

  create_table "player_products", force: :cascade do |t|
    t.string   "product_id"
    t.integer  "stock_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.integer  "level"
    t.integer  "experience"
    t.decimal  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.integer  "required_level"
    t.decimal  "price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "player_id"
    t.string   "integer"
    t.integer  "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "free_space"
  end

  add_foreign_key "deals", "players", column: "buyer_id"
  add_foreign_key "deals", "players", column: "seller_id"
end
