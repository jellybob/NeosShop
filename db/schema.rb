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

ActiveRecord::Schema.define(version: 20170929080206) do

  create_table "cards", force: :cascade do |t|
    t.string "card_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "checkouts", force: :cascade do |t|
    t.string "email"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.integer "order_id"
    t.index ["card_id"], name: "index_checkouts_on_card_id"
    t.index ["order_id"], name: "index_checkouts_on_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "order_id"
    t.integer "user_id"
    t.integer "quantity"
    t.decimal "total_price", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "unit_price", precision: 5, scale: 2
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["user_id"], name: "index_order_items_on_user_id"
  end

  create_table "order_promotions", force: :cascade do |t|
    t.integer "order_id"
    t.integer "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_promotions_on_order_id"
    t.index ["promotion_id"], name: "index_order_promotions_on_promotion_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal", precision: 12, scale: 3
    t.decimal "total", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false, null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.decimal "code", precision: 4, scale: 2
    t.string "promo_type"
    t.boolean "standalone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
