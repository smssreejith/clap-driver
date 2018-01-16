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

ActiveRecord::Schema.define(version: 20180116164933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "contact_number"
    t.string "alternate_number"
    t.string "profession"
    t.string "experience"
    t.string "enterprise"
    t.integer "age"
    t.string "sex"
    t.string "refferal_type"
    t.string "refferal"
    t.string "executive"
    t.string "email"
    t.string "vehicle_kind"
    t.string "vehicle_no"
    t.string "vehicle_brand"
    t.string "vehicle_model"
    t.string "vehicle_color"
    t.string "vehicle_gear_type"
    t.string "vehicle_no_of_gears"
    t.string "vehicle_other"
    t.string "cab_name"
    t.string "cab_agent"
    t.string "cab_rate"
    t.string "cab_total_distance"
    t.string "cab_total_fare"
    t.string "cab_kind"
    t.string "cab_no"
    t.string "cab_brand"
    t.string "cab_model"
    t.string "cab_color"
    t.string "cab_gear_type"
    t.string "cab_no_of_gears"
    t.string "home_address"
    t.string "office_address"
    t.string "location"
    t.string "current_provider"
    t.string "requirement"
    t.string "remarks"
    t.string "review"
    t.string "rating"
    t.string "suggestions"
    t.string "insights"
    t.string "to_do"
    t.datetime "last_communication"
    t.datetime "call_back"
    t.string "status"
    t.string "discounts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
