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

ActiveRecord::Schema.define(version: 20171117020154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actions_levels", id: false, force: :cascade do |t|
    t.bigint "action_id"
    t.bigint "level_id"
    t.index ["action_id"], name: "index_actions_levels_on_action_id"
    t.index ["level_id"], name: "index_actions_levels_on_level_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "body"
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "etiqueta", force: :cascade do |t|
    t.string "title"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "title"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels_questions", id: false, force: :cascade do |t|
    t.bigint "label_id"
    t.bigint "question_id"
    t.index ["label_id"], name: "index_labels_questions_on_label_id"
    t.index ["question_id"], name: "index_labels_questions_on_question_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "body"
    t.boolean "read"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oxigens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "user_id"
    t.bigint "answer_id"
    t.integer "visits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_questions_on_answer_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "reason"
    t.integer "user_id"
    t.string "reportable_type"
    t.bigint "reportable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reportable_type", "reportable_id"], name: "index_reports_on_reportable_type_and_reportable_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.string "province"
    t.string "url"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "lastname"
    t.integer "university_id"
    t.integer "level_id"
    t.integer "points"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "like"
    t.integer "user_id"
    t.string "votable_type"
    t.bigint "votable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
  end

end
