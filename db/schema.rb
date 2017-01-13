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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 84) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "artist_social_metadata", force: :cascade do |t|
    t.text     "twitter"
    t.text     "facebook"
    t.text     "linkedin"
    t.text     "tumblr"
    t.text     "snapchat"
    t.text     "email"
    t.text     "website"
    t.text     "instagram"
    t.text     "vine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "artist_id"
  end

  add_index "artist_social_metadata", ["artist_id"], name: "index_artist_social_metadata_on_artist_id", unique: true, using: :btree

  create_table "artists", force: :cascade do |t|
    t.text     "stage_name"
    t.text     "title"
    t.date     "birthdate"
    t.text     "birth_location"
    t.text     "hometown"
    t.text     "education"
    t.text     "full_bio"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "profile_image_id"
    t.string   "banner_image_id"
  end

  add_index "artists", ["user_id"], name: "index_artists_on_user_id", unique: true, using: :btree

  create_table "companies", force: :cascade do |t|
    t.text     "name"
    t.text     "company_type"
    t.text     "website"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "description"
    t.text     "email"
    t.string   "company_image_id"
    t.integer  "user_id"
    t.string   "banner_image_id"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "company_festival_links", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "festival_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "company_festival_links", ["company_id"], name: "index_company_festival_links_on_company_id", using: :btree
  add_index "company_festival_links", ["festival_id"], name: "index_company_festival_links_on_festival_id", using: :btree

  create_table "company_metadata", force: :cascade do |t|
    t.integer  "company_id"
    t.text     "address1"
    t.text     "address2"
    t.date     "date_founded"
    t.text     "location_founded"
    t.text     "founders"
    t.text     "mission"
    t.text     "history"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "company_metadata", ["company_id"], name: "index_company_metadata_on_company_id", unique: true, using: :btree

  create_table "company_production_links", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "production_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "company_production_links", ["company_id"], name: "index_company_production_links_on_company_id", using: :btree
  add_index "company_production_links", ["production_id"], name: "index_company_production_links_on_production_id", using: :btree

  create_table "company_social_metadata", force: :cascade do |t|
    t.text     "twitter"
    t.text     "facebook"
    t.text     "linkedin"
    t.text     "tumblr"
    t.text     "vine"
    t.text     "snapchat"
    t.text     "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  add_index "company_social_metadata", ["company_id"], name: "index_company_social_metadata_on_company_id", unique: true, using: :btree

  create_table "credits", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "creditable_id"
    t.string  "creditable_type"
    t.string  "credited_as"
    t.string  "position"
    t.date    "start_date"
    t.date    "end_date"
    t.boolean "original_cast"
    t.boolean "confirmed"
    t.integer "credit_type"
    t.boolean "key_credit"
  end

  add_index "credits", ["artist_id"], name: "index_credits_on_artist_id", using: :btree

  create_table "festival_production_links", force: :cascade do |t|
    t.integer  "festival_id"
    t.integer  "production_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "festival_production_links", ["festival_id"], name: "index_festival_production_links_on_festival_id", using: :btree
  add_index "festival_production_links", ["production_id"], name: "index_festival_production_links_on_production_id", using: :btree

  create_table "festivals", force: :cascade do |t|
    t.text     "title"
    t.text     "subtitle"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "banner_image_id"
    t.string   "festival_image_id"
    t.boolean  "archived"
    t.integer  "company_id"
  end

  add_index "festivals", ["company_id"], name: "index_festivals_on_company_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes", using: :btree

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "resource_id"
    t.string   "resource_type"
  end

  add_index "permissions", ["resource_type", "resource_id"], name: "index_permissions_on_resource_type_and_resource_id", using: :btree
  add_index "permissions", ["user_id"], name: "index_permissions_on_user_id", using: :btree

  create_table "photo_albums", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "has_album_id"
    t.string   "has_album_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "photo_albums", ["has_album_type", "has_album_id"], name: "index_photo_albums_on_has_album_type_and_has_album_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "credit"
    t.date     "photo_date"
    t.integer  "photo_album_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_id"
    t.string   "photo_filename"
    t.integer  "photo_size"
    t.string   "photo_content_type"
  end

  add_index "photos", ["photo_album_id"], name: "index_photos_on_photo_album_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "title"
    t.string   "credit"
    t.string   "image_id"
    t.string   "has_image_type"
    t.string   "has_image_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pictures", ["has_image_id"], name: "index_pictures_on_has_image_id", using: :btree

  create_table "press_items", force: :cascade do |t|
    t.integer  "production_id"
    t.date     "date"
    t.text     "publication"
    t.text     "quote"
    t.text     "author"
    t.text     "link"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "press_items", ["production_id"], name: "index_press_items_on_production_id", using: :btree

  create_table "production_metadata", force: :cascade do |t|
    t.integer  "production_id"
    t.text     "performance_type"
    t.text     "info_heading"
    t.text     "info"
    t.text     "warnings"
    t.text     "warning_info"
    t.text     "running_time"
    t.text     "intermissions"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "recommended_age"
    t.text     "website"
  end

  add_index "production_metadata", ["production_id"], name: "index_production_metadata_on_production_id", unique: true, using: :btree

  create_table "production_showtime_links", force: :cascade do |t|
    t.integer  "production_id"
    t.integer  "showtime_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "production_showtime_links", ["production_id"], name: "index_production_showtime_links_on_production_id", using: :btree
  add_index "production_showtime_links", ["showtime_id"], name: "index_production_showtime_links_on_showtime_id", unique: true, using: :btree

  create_table "productions", force: :cascade do |t|
    t.text     "title"
    t.boolean  "public"
    t.text     "tagline"
    t.text     "description"
    t.date     "first_performance"
    t.date     "last_performance"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "key_image_id"
    t.text     "key_image_credit"
    t.integer  "company_id"
    t.string   "banner_image_id"
    t.boolean  "archived"
    t.integer  "date_mask"
  end

  add_index "productions", ["company_id"], name: "index_productions_on_company_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "production_id"
    t.date     "date"
    t.integer  "rating"
    t.text     "title"
    t.text     "summary"
    t.text     "full_text"
    t.integer  "agree"
    t.integer  "disagree"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "reviews", ["production_id"], name: "index_reviews_on_production_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "showtime_accessibility_metadata", force: :cascade do |t|
    t.integer  "seat_capacity"
    t.boolean  "hearing_devices"
    t.text     "hearing_devices_info"
    t.boolean  "translation_devices"
    t.text     "translation_devices_info"
    t.boolean  "wheelchair_accessible"
    t.text     "wheelchair_accessible_info"
    t.boolean  "guide_dogs"
    t.text     "guide_dogs_info"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "showtime_id"
  end

  add_index "showtime_accessibility_metadata", ["showtime_id"], name: "index_showtime_accessibility_metadata_on_showtime_id", unique: true, using: :btree

  create_table "showtime_ticket_metadata", force: :cascade do |t|
    t.text     "guaranteed_price_note"
    t.text     "ticket_link"
    t.text     "reservation_link"
    t.text     "reservation_link_info"
    t.text     "reservation_phone"
    t.text     "reservation_phone_info"
    t.text     "in_person_ticketing_info"
    t.text     "special_event"
    t.text     "special_event_info"
    t.text     "additional_ticket_type"
    t.numrange "additional_ticket_type_price"
    t.text     "additional_ticket_type_info"
    t.text     "notes"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "showtime_id"
    t.decimal  "guaranteed_price"
  end

  add_index "showtime_ticket_metadata", ["showtime_id"], name: "index_showtime_ticket_metadata_on_showtime_id", unique: true, using: :btree

  create_table "showtimes", force: :cascade do |t|
    t.datetime "showtime"
    t.integer  "theater_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "production_id"
    t.date     "date"
    t.time     "time"
  end

  add_index "showtimes", ["production_id"], name: "index_showtimes_on_production_id", using: :btree
  add_index "showtimes", ["theater_id"], name: "index_showtimes_on_theater_id", using: :btree

  create_table "theater_metadata", force: :cascade do |t|
    t.integer  "seat_capacity"
    t.boolean  "hearing_devices"
    t.text     "hearing_devices_info"
    t.boolean  "translation_devices"
    t.text     "translation_devices_info"
    t.boolean  "wheelchair_accessible"
    t.text     "wheelchair_accessible_info"
    t.boolean  "guide_dogs"
    t.text     "guide_dogs_info"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "theater_id"
  end

  add_index "theater_metadata", ["theater_id"], name: "index_theater_metadata_on_theater_id", unique: true, using: :btree

  create_table "theaters", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "venue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "theaters", ["venue_id"], name: "index_theaters_on_venue_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "first_name"
    t.text     "last_name"
    t.text     "location"
    t.boolean  "admin"
    t.string   "profile_image_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.text     "name"
    t.text     "website"
    t.text     "phone_number"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "time_zone"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "lat"
    t.float    "lng"
    t.string   "banner_image_id"
    t.string   "venue_image_id"
  end

  add_index "venues", ["company_id"], name: "index_venues_on_company_id", using: :btree

  add_foreign_key "artist_social_metadata", "artists"
  add_foreign_key "artists", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "company_festival_links", "companies"
  add_foreign_key "company_festival_links", "festivals"
  add_foreign_key "company_metadata", "companies"
  add_foreign_key "company_production_links", "companies"
  add_foreign_key "company_production_links", "productions"
  add_foreign_key "company_social_metadata", "companies"
  add_foreign_key "credits", "artists"
  add_foreign_key "festival_production_links", "festivals"
  add_foreign_key "festival_production_links", "productions"
  add_foreign_key "festivals", "companies"
  add_foreign_key "permissions", "users"
  add_foreign_key "photos", "photo_albums"
  add_foreign_key "press_items", "productions"
  add_foreign_key "production_metadata", "productions"
  add_foreign_key "production_showtime_links", "productions"
  add_foreign_key "production_showtime_links", "showtimes"
  add_foreign_key "productions", "companies"
  add_foreign_key "reviews", "productions"
  add_foreign_key "reviews", "users"
  add_foreign_key "showtime_accessibility_metadata", "showtimes"
  add_foreign_key "showtime_ticket_metadata", "showtimes"
  add_foreign_key "showtimes", "productions"
  add_foreign_key "showtimes", "theaters"
  add_foreign_key "theater_metadata", "theaters"
  add_foreign_key "theaters", "venues"
  add_foreign_key "venues", "companies"
end
