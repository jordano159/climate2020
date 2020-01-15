# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_15_185901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.integer "resilience"
    t.float "init_civ"
    t.float "civ_num"
    t.float "deg"
    t.integer "life_level"
    t.integer "score"
    t.integer "year"
    t.integer "reg_rel"
    t.boolean "is_conquered"
    t.integer "agriculture"
    t.integer "education"
    t.integer "security"
    t.integer "comms"
    t.integer "social_sec"
    t.integer "health"
    t.integer "water"
    t.integer "energy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "budget"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "min_deg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "title"
    t.integer "operator"
    t.float "amount"
    t.string "on_what"
    t.bigint "event_id", null: false
    t.integer "min_resilience"
    t.integer "min_budget"
    t.float "min_civ_num"
    t.integer "min_reg_rel"
    t.integer "min_agriculture"
    t.integer "min_education"
    t.integer "min_security"
    t.integer "min_comms"
    t.integer "min_social_sec"
    t.integer "min_health"
    t.integer "min_water"
    t.integer "min_energy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_options_on_event_id"
  end

  add_foreign_key "options", "events"
end
