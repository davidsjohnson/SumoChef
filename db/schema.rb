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

ActiveRecord::Schema.define(:version => 20130409014322) do


  create_table "contains_products", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "product_id"
    t.string   "unit_of_measure"
    t.decimal  "quantity"
    t.string   "preperation_method"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "contains_products", ["product_id"], :name => "index_contains_products_on_product_id"
  add_index "contains_products", ["recipe_id", "product_id"], :name => "index_contains_products_on_recipe_id_and_product_id", :unique => true
  add_index "contains_products", ["recipe_id"], :name => "index_contains_products_on_recipe_id"

  create_table "manufacturers", :force => true do |t|
    t.string   "manufacturer_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "manufacturers", ["manufacturer_name"], :name => "index_manufacturers_on_manufacturer_name"


  create_table "products", :force => true do |t|
    t.string   "product_name"
    t.integer  "manufacturer_id"
    t.string   "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "recipe_name"
    t.string   "description"
    t.string   "directions"
    t.string   "total_prep_time"
    t.string   "total_cook_time"
    t.integer  "servings"
    t.string   "recipe_category"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "recipes", ["created_at"], :name => "index_recipes_on_created_at"
  add_index "recipes", ["recipe_name"], :name => "index_recipes_on_recipe_name"
  add_index "recipes", ["user_id"], :name => "index_recipes_on_user_id"


  create_table "shopping_lists", :force => true do |t|
    t.string   "description"
    t.string   "state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "shopping_lists", ["id", "user_id"], :name => "index_shopping_lists_on_id_and_user_id"
  add_index "shopping_lists", ["user_id"], :name => "index_shopping_lists_on_user_id"

  create_table "stores", :force => true do |t|
    t.string   "store_name"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.string   "phone"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "stores", ["store_name"], :name => "index_stores_on_store_name"

  create_table "to_buys", :force => true do |t|
    t.integer  "shopping_list_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "product_id"
  end

  add_index "to_buys", ["shopping_list_id"], :name => "index_to_buys_on_shopping_list_id"

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
