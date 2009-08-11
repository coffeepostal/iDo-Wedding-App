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

ActiveRecord::Schema.define(:version => 20090811023343) do

  create_table "addresses", :force => true do |t|
    t.integer  "guest_id"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "province"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gifts", :force => true do |t|
    t.integer  "guest_id"
    t.string   "gift"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", :force => true do |t|
    t.string   "salutation"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "email"
    t.string   "pin"
    t.boolean  "admin",            :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "additional_names"
  end

  create_table "rsvps", :force => true do |t|
    t.integer  "guest_id"
    t.boolean  "attending"
    t.integer  "number_attending"
    t.integer  "max_number_attending", :default => 2, :null => false
    t.boolean  "group_rsvp"
    t.boolean  "admin_rsvp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thank_yous", :force => true do |t|
    t.integer  "gift_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
