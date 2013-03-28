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

ActiveRecord::Schema.define(:version => 20130328003838) do

  create_table "contains_product", :id => false, :force => true do |t|
    t.integer "recipe_id",                                                      :null => false
    t.integer "product_id",                                                     :null => false
    t.string  "unit_of_measure",    :limit => 10,                               :null => false
    t.decimal "quantity",                         :precision => 4, :scale => 2, :null => false
    t.string  "preparation_method", :limit => 20
  end

  create_table "favorite", :id => false, :force => true do |t|
    t.integer "person_id", :null => false
    t.integer "recipe_id", :null => false
  end

  create_table "friend", :id => false, :force => true do |t|
    t.integer "person_id", :null => false
    t.integer "friend_id", :null => false
  end

  create_table "gstore", :primary_key => "store_id", :force => true do |t|
    t.string "store_name",     :limit => 30
    t.string "address_street", :limit => 30
    t.string "address_city",   :limit => 30
    t.string "address_state",  :limit => 2
    t.string "address_zip",    :limit => 10
    t.string "phone",          :limit => 14
  end

  create_table "located", :id => false, :force => true do |t|
    t.integer "product_id",                                 :null => false
    t.integer "store_id",                                   :null => false
    t.integer "aisle_number"
    t.decimal "price",        :precision => 5, :scale => 2
  end

  create_table "manufacturer", :primary_key => "manufacturer_id", :force => true do |t|
    t.string "manufacturer_name", :limit => 30
  end

  create_table "person", :primary_key => "user_id", :force => true do |t|
    t.string   "user_name",       :limit => 30, :null => false
    t.string   "name_first",      :limit => 20
    t.string   "name_middle",     :limit => 20
    t.string   "name_last",       :limit => 20
    t.string   "email_address",   :limit => 30
    t.string   "password_digest"
    t.datetime "member_since"
  end

  create_table "product", :primary_key => "product_id", :force => true do |t|
    t.string  "product_name",    :limit => 30,                               :null => false
    t.integer "manufacturer_id"
    t.string  "unit_of_measure", :limit => 10
    t.decimal "quantity",                      :precision => 4, :scale => 2
    t.string  "description",     :limit => 30
  end

  create_table "recipe", :primary_key => "recipe_id", :force => true do |t|
    t.string  "recipe_name",     :limit => 40,   :null => false
    t.string  "description",     :limit => 100,  :null => false
    t.string  "directions",      :limit => 2000, :null => false
    t.string  "total_prep_time", :limit => 10,   :null => false
    t.string  "total_cook_time", :limit => 10,   :null => false
    t.integer "servings",                        :null => false
    t.string  "recipe_category", :limit => 15
    t.integer "owner_id",                        :null => false
  end

  create_table "shopping_list", :primary_key => "shopping_list_id", :force => true do |t|
    t.string "description", :limit => 50
    t.string "state",       :limit => 10
  end

  create_table "to_buy", :id => false, :force => true do |t|
    t.integer "shopping_list_id", :null => false
    t.integer "product_id",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "name_first"
    t.string   "name_middle"
    t.string   "name_last"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
