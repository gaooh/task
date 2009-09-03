# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081207092423) do

  create_table "friends", :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "friend_user_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pokes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "task_id",    :null => false
    t.integer  "num",        :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_messages", :force => true do |t|
    t.text     "body",       :limit => 2000, :null => false
    t.boolean  "read",                       :null => false
    t.integer  "user_id",                    :null => false
    t.integer  "task_id",                    :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title",        :limit => 200,  :null => false
    t.string   "body",         :limit => 2000, :null => false
    t.integer  "user_id",                      :null => false
    t.integer  "keep_user_id",                 :null => false
    t.integer  "status"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "deleted_at"
    t.string   "feel",                      :limit => 120
  end

end
