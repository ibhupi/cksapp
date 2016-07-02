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

ActiveRecord::Schema.define(version: 0) do

  create_table "countries", force: :cascade do |t|
    t.string "name",  limit: 255
    t.binary "photo", limit: 65535
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",           limit: 225
    t.string   "description",     limit: 225
    t.datetime "startTime"
    t.datetime "endTime"
    t.integer  "teamCount",       limit: 4
    t.string   "playerCount",     limit: 225
    t.string   "countryList",     limit: 225
    t.string   "gender",          limit: 225
    t.string   "eventTypeDetail", limit: 225
    t.string   "eventType",       limit: 225
    t.integer  "location",        limit: 4
    t.integer  "ranking",         limit: 4
    t.string   "temperature",     limit: 225
    t.string   "condition",       limit: 225
    t.string   "hashtag",         limit: 225
    t.binary   "photo",           limit: 65535
  end

  create_table "locations", force: :cascade do |t|
    t.string  "title",       limit: 255
    t.string  "lattitude",   limit: 255
    t.string  "longitude",   limit: 255
    t.string  "description", limit: 255
    t.integer "ranking",     limit: 4
    t.binary  "photo",       limit: 65535
  end

  create_table "players", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.string  "gender",    limit: 255
    t.string  "gamesList", limit: 255
    t.integer "country",   limit: 4
    t.binary  "photo",     limit: 65535
  end

  create_table "user_schedules", force: :cascade do |t|
    t.integer "userID",   limit: 4
    t.integer "like",     limit: 4
    t.boolean "canShare"
    t.string  "detail",   limit: 255
    t.date    "date"
  end

  create_table "users", force: :cascade do |t|
    t.string "name",  limit: 255
    t.binary "photo", limit: 65535
  end

end
