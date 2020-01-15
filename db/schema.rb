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

ActiveRecord::Schema.define(version: 2020_01_15_151403) do

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

end
