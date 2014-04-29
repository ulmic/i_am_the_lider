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

ActiveRecord::Schema.define(:version => 20140429083542) do

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blog_posts", :force => true do |t|
    t.text     "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "criterions", :force => true do |t|
    t.text     "title"
    t.integer  "stage_id"
    t.integer  "maximum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "districts", :force => true do |t|
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "evaluations", :force => true do |t|
    t.integer  "criterion_id"
    t.integer  "value"
    t.integer  "rating_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "event_participants", :force => true do |t|
    t.text     "full_name"
    t.text     "school"
    t.integer  "report_id"
    t.text     "group"
    t.text     "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_photos", :force => true do |t|
    t.text     "file"
    t.integer  "report_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_reports", :force => true do |t|
    t.text     "description"
    t.text     "document"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "results"
  end

  create_table "events", :force => true do |t|
    t.text     "title"
    t.text     "goal"
    t.text     "tasks"
    t.text     "participant_category"
    t.text     "description"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.text     "adress"
    t.float    "latitude"
    t.float    "longtitude"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "jurors", :force => true do |t|
    t.text     "first_name"
    t.string   "last_name"
    t.string   "login"
    t.string   "password"
    t.integer  "stage_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.text     "title"
    t.text     "body"
    t.date     "pusblished_at"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "photo"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "goal"
    t.text     "tasks"
    t.text     "target_audience"
    t.text     "place"
    t.text     "description"
    t.date     "date"
    t.text     "results"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "juror_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reserve_reasons", :force => true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stages", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.date     "begin_date"
    t.date     "end_date"
    t.integer  "average"
    t.string   "publish"
    t.string   "publish_state"
    t.string   "ratings_publish_state"
  end

  create_table "users", :force => true do |t|
    t.string   "password"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "district_id"
    t.date     "birth_date"
    t.text     "school"
    t.text     "group"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.text     "email"
    t.text     "vkontakte"
    t.text     "twitter"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "adress_index"
    t.text     "locality"
    t.string   "confirm_state"
    t.integer  "last_stage_id"
  end

  create_table "works", :force => true do |t|
    t.integer  "user_id"
    t.text     "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "link"
  end

end
