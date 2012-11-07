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

ActiveRecord::Schema.define(:version => 20120407095126) do

  create_table "resources", :force => true do |t|
    t.text     "description"
    t.string   "title"
    t.string   "uri"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "image_uri"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.string   "type_id"
    t.integer  "up_count",    :default => 0
    t.integer  "down_count",  :default => 0
    t.integer  "add_count",   :default => 1
  end

  create_table "resources_users_actions", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "user_id"
    t.integer  "user_action"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "up_count",    :default => 0
    t.integer  "down_count",  :default => 0
  end

  create_table "topics_users", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics_users_actions", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.integer  "user_action"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "is_registered"
    t.string   "screen_name",     :limit => 100
  end

end
