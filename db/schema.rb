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

ActiveRecord::Schema.define(:version => 20120606114148) do

  create_table "archives", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "key"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "nitch_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "archives", ["key"], :name => "index_archives_on_key"
  add_index "archives", ["slug"], :name => "index_archives_on_slug"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.string   "key"
    t.string   "ancestry"
    t.integer  "ancestry_depth", :default => 0
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "archive_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "comments", ["ancestry"], :name => "index_comments_on_ancestry"
  add_index "comments", ["archive_id"], :name => "index_comments_on_archive_id"
  add_index "comments", ["key"], :name => "index_comments_on_key"
  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "invite_requests", :force => true do |t|
    t.integer  "nitch_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nitches", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "description"
    t.string   "privacy"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "nitches", ["name"], :name => "index_nitches_on_name", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "slug"
    t.string   "key"
    t.string   "title"
    t.text     "body"
    t.string   "link_url"
    t.integer  "type"
    t.integer  "user_id"
    t.integer  "nitch_id"
    t.integer  "archive_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["archive_id"], :name => "index_posts_on_archive_id"
  add_index "posts", ["key"], :name => "index_posts_on_key"
  add_index "posts", ["nitch_id"], :name => "index_posts_on_nitch_id"
  add_index "posts", ["slug"], :name => "index_posts_on_slug"
  add_index "posts", ["type"], :name => "index_posts_on_type"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.string   "var",                       :null => false
    t.text     "value"
    t.integer  "target_id"
    t.string   "target_type", :limit => 30
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "settings", ["target_type", "target_id", "var"], :name => "index_settings_on_target_type_and_target_id_and_var", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",                          :null => false
    t.string   "email",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_login", :unique => true

end
