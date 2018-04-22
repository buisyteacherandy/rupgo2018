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

ActiveRecord::Schema.define(version: 20180414164952) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "catecover_file_name"
    t.string   "catecover_content_type"
    t.integer  "catecover_file_size"
    t.datetime "catecover_updated_at"
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "catecover"
    t.index ["category_id"], name: "index_category_translations_on_category_id"
    t.index ["locale"], name: "index_category_translations_on_locale"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "destination_id"
    t.text     "body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["destination_id"], name: "index_comments_on_destination_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "deal_translations", force: :cascade do |t|
    t.integer  "deal_id",           null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "place"
    t.text     "description"
    t.text     "details"
    t.text     "other_details"
    t.text     "policies_and_fees"
    t.decimal  "price"
    t.index ["deal_id"], name: "index_deal_translations_on_deal_id"
    t.index ["locale"], name: "index_deal_translations_on_locale"
  end

  create_table "deals", force: :cascade do |t|
    t.string   "place"
    t.text     "description"
    t.text     "details"
    t.text     "other_details"
    t.text     "policies_and_fees"
    t.decimal  "price",             precision: 10, scale: 3
    t.integer  "user_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "destination_id"
    t.date     "check_in"
    t.date     "check_out"
    t.string   "pic1_file_name"
    t.string   "pic1_content_type"
    t.integer  "pic1_file_size"
    t.datetime "pic1_updated_at"
    t.text     "currency"
    t.string   "filter"
    t.string   "category"
    t.text     "video_deal"
    t.string   "daterange"
    t.index ["destination_id"], name: "index_deals_on_destination_id"
    t.index ["user_id"], name: "index_deals_on_user_id"
  end

  create_table "destination_translations", force: :cascade do |t|
    t.integer  "destination_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "place"
    t.text     "why_go"
    t.text     "to_do"
    t.text     "sights"
    t.text     "festivals"
    t.text     "sleep"
    t.text     "eat"
    t.text     "drink"
    t.text     "shop"
    t.text     "around"
    t.index ["destination_id"], name: "index_destination_translations_on_destination_id"
    t.index ["locale"], name: "index_destination_translations_on_locale"
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "place"
    t.text     "why_go"
    t.text     "to_do"
    t.text     "sights"
    t.text     "festivals"
    t.text     "sleep"
    t.text     "eat"
    t.text     "drink"
    t.text     "shop"
    t.text     "around"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "state",              default: "in_draft"
    t.integer  "region_id"
    t.string   "filter"
    t.string   "category"
    t.index ["region_id"], name: "index_destinations_on_region_id"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "has_categories", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "category_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["category_id"], name: "index_has_categories_on_category_id"
    t.index ["destination_id"], name: "index_has_categories_on_destination_id"
  end

  create_table "has_packages", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "deal_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["deal_id"], name: "index_has_packages_on_deal_id"
    t.index ["destination_id"], name: "index_has_packages_on_destination_id"
  end

  create_table "has_regions", force: :cascade do |t|
    t.integer  "deal_id"
    t.integer  "region_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "destination_id"
    t.index ["deal_id"], name: "index_has_regions_on_deal_id"
    t.index ["destination_id"], name: "index_has_regions_on_destination_id"
    t.index ["region_id"], name: "index_has_regions_on_region_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "deal_id"
    t.integer  "user_id"
    t.integer  "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "quantity"
    t.integer  "total"
    t.string   "daterange"
    t.index ["deal_id"], name: "index_payments_on_deal_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_questions_on_deal_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "region_translations", force: :cascade do |t|
    t.integer  "region_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "rcover"
    t.index ["locale"], name: "index_region_translations_on_locale"
    t.index ["region_id"], name: "index_region_translations_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "destination_id"
    t.string   "rcover_file_name"
    t.string   "rcover_content_type"
    t.integer  "rcover_file_size"
    t.datetime "rcover_updated_at"
    t.index ["destination_id"], name: "index_regions_on_destination_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.string   "filter"
    t.decimal  "min_price"
    t.decimal  "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "token"
    t.string   "payerid"
    t.integer  "user_id"
    t.decimal  "total",      precision: 10, scale: 3
    t.string   "answer"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "ip_address"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "user_providers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_providers_on_user_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "permission_level",       default: 1
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.text     "image"
    t.datetime "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
