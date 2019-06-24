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

ActiveRecord::Schema.define(version: 2019_06_24_120915) do

  create_table "card_payments", force: :cascade do |t|
    t.string "merchant_name"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_voucher_credits", force: :cascade do |t|
    t.string "company_name"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resto_orders", force: :cascade do |t|
    t.string "resto_name"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_view "transactions", sql_definition: <<-SQL
      SELECT
    id,
    merchant_name AS name,
    updated_at,
    created_at,
    "card" AS source_type
  FROM
    card_payments
  UNION
  SELECT
    id,
    resto_name AS name,
    updated_at,
    created_at,
    "resto" AS source_type
  FROM
    resto_orders
  UNION
  SELECT
    id,
    company_name AS name,
    updated_at,
    created_at,
    "voucher" AS source_type
  FROM
    meal_voucher_credits
  SQL
end
