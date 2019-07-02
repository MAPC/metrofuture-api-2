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

ActiveRecord::Schema.define(version: 5) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "municipalities", force: :cascade do |t|
    t.string "name"
    t.integer "muni_id"
    t.json "geojson"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipality_projects", force: :cascade do |t|
    t.integer "municipality_id"
    t.integer "project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "status"
    t.string "primary_department"
    t.string "primary_department_css_class"
    t.string "start_date"
    t.string "end_date"
    t.string "actual_completion_date"
    t.string "project_manager_first_name"
    t.string "project_manager_last_name"
    t.string "project_geography"
    t.string "equity_considerations"
    t.boolean "show_on_website_map"
    t.string "client"
    t.string "collaboration_departments"
    t.string "description"
    t.string "equity_categories"
    t.string "equity_comment"
    t.string "equity_impact"
    t.string "external_partner"
    t.string "funding"
    t.string "location_city"
    t.string "location_state"
    t.string "location_zip"
    t.string "mapc_project_num"
    t.string "climate_change"
    t.string "equity"
    t.string "regional_collaboration"
    t.string "smart_growth"
    t.string "website"
  end

  create_table "subregion_municipalities", force: :cascade do |t|
    t.integer "subregion_id"
    t.integer "municipality_id"
  end

  create_table "subregions", force: :cascade do |t|
    t.string "name"
    t.string "abbv"
    t.json "geojson"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
