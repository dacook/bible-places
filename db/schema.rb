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

ActiveRecord::Schema.define(version: 20130905045832) do

  create_table "books", force: true do |t|
    t.string "name"
  end

  create_table "place_refs", force: true do |t|
    t.integer "place_id"
    t.integer "book_id"
    t.integer "chapter"
    t.integer "verse"
    t.integer "chapter_end"
    t.integer "verse_end"
  end

  create_table "places", force: true do |t|
    t.string  "name"
    t.string  "root_name"
    t.decimal "lat",       precision: 9, scale: 6
    t.decimal "lon",       precision: 9, scale: 6
    t.string  "verses"
    t.string  "attribs"
    t.string  "comments"
  end

end
