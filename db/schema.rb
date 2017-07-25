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

ActiveRecord::Schema.define(version: 20170725220112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "report_id"
    t.integer  "tip_id"
    t.string   "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "tip_id"
    t.integer  "report_id"
    t.integer  "answer_id"
    t.boolean  "read",       default: false
    t.integer  "forum_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "forums", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
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

  create_table "images", force: :cascade do |t|
    t.integer  "report_id"
    t.string   "subtitle"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "url"
    t.integer  "tip_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "inappropriates", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "tip_id"
    t.integer  "comment_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.integer  "report_id"
    t.boolean  "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "answer_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "image",      default: "http://www.survivetravel.com/wp-content/uploads/2015/11/World-Travel-Wallpaper-3.jpg"
    t.datetime "created_at",                                                                                                  null: false
    t.datetime "updated_at",                                                                                                  null: false
    t.boolean  "missing"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.integer  "answer_id"
    t.boolean  "read",        default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "tip_id"
    t.integer  "report_id"
    t.integer  "question_id"
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "weburl"
    t.integer  "report_id"
    t.integer  "tip_id"
    t.integer  "user_id"
    t.string   "subtitle"
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
    t.text     "text"
    t.boolean  "posted_live"
    t.string   "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "score",        default: 0
    t.text     "about_author"
  end

  create_table "tips", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.string   "venue"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "category"
    t.integer  "location_id"
    t.integer  "score",       default: 0
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
