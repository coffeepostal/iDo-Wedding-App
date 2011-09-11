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

ActiveRecord::Schema.define(:version => 20110911020836) do

  create_table "addresses", :force => true do |t|
    t.integer  "guest_id"
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "zip"
    t.string   "state_code"
    t.string   "country_code"
    t.string   "province_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["guest_id"], :name => "index_addresses_on_guest_id"

  create_table "gifts", :force => true do |t|
    t.integer  "guest_id"
    t.string   "gift"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gifts", ["guest_id"], :name => "index_gifts_on_guest_id"

  create_table "guests", :force => true do |t|
    t.string   "honorific"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name_suffix"
    t.string   "additional_names"
    t.string   "email"
    t.string   "pin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rsvps", :force => true do |t|
    t.integer  "guest_id"
    t.boolean  "attending"
    t.integer  "number_attending"
    t.integer  "max_number_attending"
    t.boolean  "group_rsvp"
    t.boolean  "admin_rsvp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rsvps", ["guest_id"], :name => "index_rsvps_on_guest_id"

  create_table "thank_yous", :force => true do |t|
    t.integer  "gift_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "thank_yous", ["gift_id"], :name => "index_thank_yous_on_gift_id"

end
