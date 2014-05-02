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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20140501225103) do
=======
ActiveRecord::Schema.define(:version => 20140501234553) do
>>>>>>> a7b2591a66336d0a7942fcdf71f05aabcf66a47e

  create_table "recipes", :force => true do |t|
    t.string "name"
    t.string "img_url"
    t.string "recipe_url"
    t.text   "components"
    t.string "yummly_id"
  end

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
