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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120822161556) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "year"
    t.boolean  "admin",                  :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "hours_override_note"
    t.integer  "hours_override_amount"
    t.integer  "family_type_id"
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["remember_token"], :name => "index_accounts_on_remember_token"

  create_table "activities", :force => true do |t|
    t.string   "activity"
    t.string   "description"
    t.boolean  "priority"
    t.string   "chair"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "activity_workers", :force => true do |t|
    t.integer "activity_id", :null => false
    t.integer "worker_id",   :null => false
  end

  create_table "descriptions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.integer  "multiplier"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "family_types", :force => true do |t|
    t.string   "name"
    t.integer  "hours_required"
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "volunteer_events", :force => true do |t|
    t.string   "name"
    t.date     "event_date"
    t.integer  "hours_worked"
    t.integer  "eventtype"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "worker_id"
  end

  add_index "volunteer_events", ["eventtype", "created_at"], :name => "index_volunteer_events_on_eventtype_and_created_at"

  create_table "workers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "account_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "stand_certified",       :default => false
    t.date     "stand_expiration_date"
    t.string   "relationship"
    t.string   "phone"
    t.string   "occupation"
  end

  add_index "workers", ["account_id", "created_at"], :name => "index_workers_on_account_id_and_created_at"

end
