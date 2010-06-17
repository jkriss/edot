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

ActiveRecord::Schema.define(:version => 20100617202210) do

  create_table "beta_signups", :force => true do |t|
    t.string    "email_address"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "top_user_id"
    t.integer   "top_user_score"
    t.datetime  "top_user_updated_at"
  end

  create_table "category_subcategories", :force => true do |t|
    t.integer   "category_id"
    t.integer   "subcategory_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "thing_cats", :force => true do |t|
    t.string    "name"
    t.integer   "points"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "thing_comments", :force => true do |t|
    t.integer  "thing_id"
    t.integer  "user_id"
    t.string   "comment",    :limit => 2500
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "things", :force => true do |t|
    t.integer   "user_id"
    t.integer   "thing_cat_id"
    t.string    "text"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "login",                        :limit => 40
    t.string    "name",                         :limit => 100, :default => ""
    t.string    "email",                        :limit => 100
    t.string    "crypted_password",             :limit => 40
    t.string    "salt",                         :limit => 40
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "remember_token",               :limit => 40
    t.timestamp "remember_token_expires_at"
    t.integer   "cached_points"
    t.boolean   "is_admin"
    t.string    "twitter_id"
    t.string    "access_token"
    t.string    "access_secret"
    t.string    "location"
    t.string    "description"
    t.string    "profile_image_url"
    t.string    "url"
    t.string    "profile_background_color"
    t.string    "profile_sidebar_fill_color"
    t.string    "profile_link_color"
    t.string    "profile_sidebar_border_color"
    t.string    "profile_text_color"
    t.string    "profile_background_image_url"
    t.string    "profile_background_tile"
    t.string    "time_zone"
    t.integer   "friends_count"
    t.integer   "statuses_count"
    t.integer   "followers_count"
    t.integer   "favourites_count"
    t.integer   "utc_offset"
    t.datetime  "last_comment_view"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
