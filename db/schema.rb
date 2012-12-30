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

ActiveRecord::Schema.define(:version => 20121230181454) do

  create_table "translation_steps", :force => true do |t|
    t.string   "language"
    t.integer  "previous_translation_step"
    t.integer  "next_translation_step"
    t.integer  "translation_id"
    t.text     "starting_phrase"
    t.text     "ending_phrase"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "from_language"
    t.string   "to_language"
  end

  create_table "translations", :force => true do |t|
    t.text     "starting_phrase"
    t.text     "ending_phrase"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
