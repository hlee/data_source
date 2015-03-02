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

ActiveRecord::Schema.define(version: 20150302015821) do

  create_table "contain_urls", force: :cascade do |t|
    t.string   "url"
    t.integer  "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contain_urls", ["tweet_id"], name: "index_contain_urls_on_tweet_id"

  create_table "hashtag_mappings", force: :cascade do |t|
    t.integer  "hashtag_id"
    t.integer  "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hashtag_mappings", ["hashtag_id"], name: "index_hashtag_mappings_on_hashtag_id"
  add_index "hashtag_mappings", ["tweet_id"], name: "index_hashtag_mappings_on_tweet_id"

  create_table "hashtags", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.datetime "published_at"
    t.string   "content"
    t.integer  "favorite_count"
    t.integer  "retweet_count"
    t.string   "original_url"
    t.boolean  "reply"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "origin_id"
  end

  create_table "user_mention_mappings", force: :cascade do |t|
    t.integer  "user_mention_id"
    t.integer  "tweet_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_mention_mappings", ["tweet_id"], name: "index_user_mention_mappings_on_tweet_id"
  add_index "user_mention_mappings", ["user_mention_id"], name: "index_user_mention_mappings_on_user_mention_id"

  create_table "user_mentions", force: :cascade do |t|
    t.string   "screen_name"
    t.string   "name"
    t.string   "original_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
