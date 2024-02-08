# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_07_115846) do
  create_table "retailers", force: :cascade do |t|
    t.string "directory_category"
    t.integer "content_children_count"
    t.string "directory_contact__email"
    t.string "directory_contact__fax"
    t.string "directory_contact__mobile"
    t.string "directory_contact__phone"
    t.string "directory_contact__website"
    t.integer "content_post_id"
    t.string "content_post_slug"
    t.text "content_body"
    t.string "directory_location__street"
    t.string "directory_location__city"
    t.string "directory_location__country"
    t.string "directory_location__address"
    t.float "directory_location__lat"
    t.float "directory_location__lng"
    t.string "directory_location__zip"
    t.string "directory_location__state"
    t.string "directory_social__facebook"
    t.string "directory_social__googleplus"
    t.string "directory_social__twitter"
    t.string "content_post_status"
    t.string "content_post_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
