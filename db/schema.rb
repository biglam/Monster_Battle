# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151209232710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battle_monster_moves", force: :cascade do |t|
    t.integer  "battle_monster_id"
    t.integer  "move_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "remaining_uses"
  end

  create_table "battle_monsters", force: :cascade do |t|
    t.integer  "monster_id"
    t.integer  "battle_id"
    t.string   "player"
    t.integer  "hp"
    t.integer  "position"
    t.integer  "element_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battles", force: :cascade do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.string   "p1_monsters"
    t.string   "p2_monsters"
    t.integer  "winner_id"
    t.integer  "stadium_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "turn"
    t.string   "state"
  end

  create_table "elements", force: :cascade do |t|
    t.string   "name",       default: "Element_X"
    t.string   "strong_to",  default: ""
    t.string   "weak_to",    default: ""
    t.string   "neutral",    default: ""
    t.string   "immune",     default: ""
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string   "name",         default: "Pichu"
    t.integer  "element_id"
    t.integer  "move_id"
    t.string   "image_front"
    t.string   "image_back"
    t.string   "strike_sound"
    t.string   "hurt_sound"
    t.integer  "hp",           default: 1000
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "monsters_moves", id: false, force: :cascade do |t|
    t.integer "monster_id", null: false
    t.integer "move_id",    null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string   "name",           default: "Attack"
    t.integer  "strength",       default: 50
    t.integer  "element_id"
    t.boolean  "special",        default: false
    t.integer  "remaining_uses", default: 10
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.integer  "wins",                   default: 0
    t.integer  "points",                 default: 0
    t.integer  "played",                 default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "gender"
    t.integer  "avatar",                 default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
