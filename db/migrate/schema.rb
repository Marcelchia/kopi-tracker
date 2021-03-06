ActiveRecord::Schema.define(version: 2020_05_13_100526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_kopis", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "kopi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customers_kopis_on_customer_id"
    t.index ["kopi_id"], name: "index_customers_kopis_on_kopi_id"
  end

  create_table "kopi_farms", force: :cascade do |t|
    t.string "location"
    t.string "phone_num"
  end

  create_table "kopis", force: :cascade do |t|
    t.string "name"
    t.bigint "roast_id"
    t.bigint "kopi_farm_id"
    t.bigint "user_id"
    t.index ["kopi_farm_id"], name: "index_kopis_on_kopi_farm_id"
    t.index ["roast_id"], name: "index_kopis_on_roast_id"
    t.index ["user_id"], name: "index_kopis_on_user_id"
  end

  create_table "roasts", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "kopis", "users"
end