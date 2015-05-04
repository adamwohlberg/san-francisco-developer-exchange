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

ActiveRecord::Schema.define(version: 20150504063448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount",                  precision: 10, scale: 2
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employer_id"
    t.integer  "developer_id"
    t.string   "company"
    t.boolean  "agree_to_terms"
    t.string   "relationship_type"
    t.string   "image"
    t.string   "ein"
    t.decimal  "balance",                 precision: 10, scale: 2
    t.decimal  "total_payment",           precision: 10, scale: 2
    t.decimal  "service_fee",             precision: 10, scale: 2
    t.string   "status",                                           default: "open"
    t.integer  "document_id"
    t.boolean  "paid",                                             default: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "paid_at"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "visible",                                          default: true
  end

  add_index "contracts", ["developer_id"], name: "index_contracts_on_developer_id", using: :btree
  add_index "contracts", ["employer_id"], name: "index_contracts_on_employer_id", using: :btree

  create_table "contracts_developer_favorites", id: false, force: true do |t|
    t.integer "developer_id"
    t.integer "contract_id"
  end

  create_table "contracts_skills", id: false, force: true do |t|
    t.integer "contract_id"
    t.integer "skill_id"
  end

  add_index "contracts_skills", ["contract_id", "skill_id"], name: "index_by_contract_and_skills", unique: true, using: :btree

  create_table "developer_favorites", id: false, force: true do |t|
    t.integer "developer_id"
    t.integer "contract_id"
  end

  add_index "developer_favorites", ["developer_id", "contract_id"], name: "index_developer_favorites_on_developer_id_and_contract_id", unique: true, using: :btree

  create_table "developers_skills", id: false, force: true do |t|
    t.integer "developer_id"
    t.integer "skill_id"
  end

  add_index "developers_skills", ["developer_id", "skill_id"], name: "index_by_developer_and_skills", unique: true, using: :btree

  create_table "employer_blocks", id: false, force: true do |t|
    t.integer "employer_id"
    t.integer "developer_id"
  end

  add_index "employer_blocks", ["employer_id", "developer_id"], name: "index_employer_blocks_on_employer_id_and_developer_id", unique: true, using: :btree

  create_table "employer_favorites", id: false, force: true do |t|
    t.integer "employer_id"
    t.integer "developer_id"
  end

  add_index "employer_favorites", ["employer_id", "developer_id"], name: "index_employer_favorites_on_employer_id_and_developer_id", unique: true, using: :btree

  create_table "negotiation_messages", force: true do |t|
    t.integer  "negotiation_id"
    t.boolean  "is_employer",    default: false
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "negotiations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message_content"
    t.string   "filename"
    t.string   "content_type"
    t.binary   "data"
    t.integer  "developer_id"
    t.integer  "employer_id"
    t.string   "summary"
    t.integer  "contract_id"
  end

  add_index "negotiations", ["developer_id", "employer_id"], name: "index_negotiations_on_developer_id_and_employer_id", using: :btree

  create_table "payment_notifications", force: true do |t|
    t.text     "params"
    t.integer  "contract_id"
    t.string   "status"
    t.string   "transaction_id"
    t.string   "create"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.decimal  "amount",      precision: 10, scale: 0
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "developer_review"
    t.text     "employer_review"
    t.decimal  "developer_stars",          precision: 10, scale: 0
    t.decimal  "employer_stars",           precision: 10, scale: 0
    t.string   "developer_reviewer_email"
    t.string   "employer_reviewer_email"
  end

  create_table "searches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_categories", force: true do |t|
    t.string  "name"
    t.integer "position"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_category_id"
    t.integer  "position"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                                           default: "",            null: false
    t.string   "encrypted_password",                              default: "",            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,             null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location",                                        default: "Hanalei, HI"
    t.string   "ip"
    t.string   "type"
    t.string   "company_name"
    t.string   "title"
    t.text     "description"
    t.string   "ein"
    t.string   "fb_image"
    t.decimal  "min_contract_amount",    precision: 10, scale: 2
    t.boolean  "agree_to_terms"
    t.decimal  "balance",                precision: 10, scale: 2
    t.string   "cell"
    t.string   "full_time_option"
    t.string   "verified"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "provider"
    t.integer  "level",                                           default: 1
    t.string   "paypal_email"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
