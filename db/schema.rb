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

ActiveRecord::Schema.define(version: 2016_02_08_205854) do

  create_table "attendees", force: :cascade do |t|
    t.string "email"
    t.boolean "paid", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: :cascade do |t|
    t.text "name"
    t.text "value"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
