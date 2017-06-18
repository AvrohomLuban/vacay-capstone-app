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

ActiveRecord::Schema.define(version: 20170618180209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tip_id"
    t.integer  "report_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.integer  "tip_id"
    t.integer  "report_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "guide_locations", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "location_id"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "guides", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.integer  "report_id"
    t.boolean  "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.string   "question"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.string   "season"
    t.string   "duration"
    t.string   "text"
    t.boolean  "posted_live"
    t.string   "title_font"
    t.string   "destination_font"
    t.string   "season_font"
    t.string   "duration_font"
    t.string   "text_font"
    t.string   "title_size"
    t.string   "destination_size"
    t.string   "season_size"
    t.string   "text_size"
    t.string   "duration_size"
    t.string   "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "city2"
    t.string   "state2"
    t.string   "country2"
    t.string   "city3"
    t.string   "state3"
    t.string   "country3"
    t.string   "city4"
    t.string   "state4"
    t.string   "country4"
    t.string   "city5"
    t.string   "state5"
    t.string   "country5"
  end

  create_table "tips", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "report_id"
    t.string   "venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                 null: false
    t.string   "encrypted_password",     default: "",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "username"
    t.string   "location"
    t.string   "status",                 default: "Non-Elite Member"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
