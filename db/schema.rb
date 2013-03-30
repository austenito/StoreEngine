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

ActiveRecord::Schema.define(:version => 20130330023529) do

  create_table "cart_products", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   :default => 1
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_products", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
    t.string   "user_id"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.string   "name"
    t.string   "description"
    t.decimal  "price",              :precision => 8, :scale => 2
    t.boolean  "retired",                                          :default => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                                           :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.boolean  "admin",                        :default => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

  create_table "will_filter_filters", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "data"
    t.integer  "user_id"
    t.string   "model_class_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "will_filter_filters", ["user_id"], :name => "index_will_filter_filters_on_user_id"

end
