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

ActiveRecord::Schema.define(version: 2019_12_05_022321) do

  create_table "item_shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_shops_on_item_id"
    t.index ["shop_id"], name: "index_item_shops_on_shop_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.integer "price", null: false
    t.integer "kcal", null: false
    t.decimal "protein", precision: 3, scale: 1, null: false
    t.decimal "fat", precision: 3, scale: 1, null: false
    t.decimal "carb", precision: 3, scale: 1, null: false
    t.decimal "salt", precision: 3, scale: 1, null: false
    t.string "note"
    t.bigint "genre_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_items_on_genre_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.integer "taste", null: false
    t.integer "volume", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_reviews_on_item_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "salt"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender", null: false
    t.decimal "height", precision: 4, scale: 1, null: false
    t.decimal "weight", precision: 4, scale: 1, null: false
    t.decimal "pal", precision: 3, scale: 2, null: false
    t.date "birthday", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "item_shops", "items"
  add_foreign_key "item_shops", "shops"
  add_foreign_key "reviews", "items"
  add_foreign_key "reviews", "users"
end
