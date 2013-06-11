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

ActiveRecord::Schema.define(:version => 20130611112248) do

  create_table "audits", :force => true do |t|
    t.string   "gtin",               :default => "", :null => false
    t.integer  "retailer_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "status_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "gtin_id"
  end

  create_table "gtins", :force => true do |t|
    t.integer  "product_id"
    t.string   "gtin"
    t.string   "version"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

  create_table "images", :force => true do |t|
    t.integer  "audit_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "images", ["audit_id"], :name => "index_images_on_audit_id"

  create_table "products", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "product_id"
  end

  create_table "retailer_fields", :force => true do |t|
    t.string   "field_name"
    t.text     "content"
    t.integer  "audit_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "retailer_fields", ["audit_id"], :name => "index_retailer_fields_on_audit_id"

  create_table "retailers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
