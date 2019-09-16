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

ActiveRecord::Schema.define(version: 2019_09_16_132207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arenas", force: :cascade do |t|
    t.string "arena_name"
    t.text "arena_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "combats", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "equipment_name"
    t.integer "attack_strength"
    t.integer "defense_strength"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.integer "hitpoints"
    t.integer "strength"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "turns", force: :cascade do |t|
    t.integer "hit_with"
    t.integer "hitpoints_left"
    t.string "attacker_name"
    t.string "defender_name"
    t.bigint "combat_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combat_id"], name: "index_turns_on_combat_id"
  end

end
