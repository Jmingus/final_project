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

ActiveRecord::Schema.define(version: 20150313215950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animes", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.string   "plot_summary", default: "Not Available"
    t.integer  "rating",       default: 1
    t.string   "image",        default: "Not Available"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "api_id"
    t.string   "api_gid"
    t.string   "vintage",      default: "Not Available"
  end

  add_index "animes", ["user_id"], name: "index_animes_on_user_id", using: :btree

  create_table "mangas", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.string   "plot_summary", default: "Not Available"
    t.string   "image",        default: "Not Available"
    t.integer  "rating",       default: 1
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "api_id"
    t.string   "api_gid"
    t.string   "vintage",      default: "Not Available"
  end

  add_index "mangas", ["user_id"], name: "index_mangas_on_user_id", using: :btree

  create_table "user_animes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "anime_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "finished",   default: false
    t.boolean  "favorite",   default: false
  end

  add_index "user_animes", ["anime_id"], name: "index_user_animes_on_anime_id", using: :btree
  add_index "user_animes", ["user_id"], name: "index_user_animes_on_user_id", using: :btree

  create_table "user_mangas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "manga_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "finished",   default: false
    t.boolean  "favorite",   default: false
  end

  add_index "user_mangas", ["manga_id"], name: "index_user_mangas_on_manga_id", using: :btree
  add_index "user_mangas", ["user_id"], name: "index_user_mangas_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",                           null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "animes", "users"
  add_foreign_key "mangas", "users"
  add_foreign_key "user_animes", "animes"
  add_foreign_key "user_animes", "users"
  add_foreign_key "user_mangas", "mangas"
  add_foreign_key "user_mangas", "users"
end
