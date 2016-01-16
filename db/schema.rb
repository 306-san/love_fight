ActiveRecord::Schema.define(version: 20160116113825) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "prof_pic"
    t.string   "login_id"
    t.string   "login_pass"
    t.string   "description"
    t.integer  "type_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "records", force: :cascade do |t|
    t.string   "name"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.date     "fight_date"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "votes"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
