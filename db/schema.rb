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

ActiveRecord::Schema.define(version: 20_211_108_002_048) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'activities', force: :cascade do |t|
    t.string 'name'
    t.integer 'num_points'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'admins', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'full_name'
    t.string 'uid'
    t.string 'avatar_url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admins_on_email', unique: true
  end

  create_table 'announcements', force: :cascade do |t|
    t.string 'title'
    t.string 'message'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'bios', force: :cascade do |t|
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'member_id', null: false
    t.index ['member_id'], name: 'index_bios_on_member_id'
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.date 'date'
    t.boolean 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'activity_id', null: false
    t.index ['activity_id'], name: 'index_events_on_activity_id'
  end

  create_table 'joins', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'meeting_id', null: false
    t.bigint 'member_id', null: false
    t.index ['meeting_id'], name: 'index_joins_on_meeting_id'
    t.index ['member_id'], name: 'index_joins_on_member_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'member_id', null: false
    t.bigint 'post_id', null: false
    t.index ['member_id'], name: 'index_likes_on_member_id'
    t.index ['post_id'], name: 'index_likes_on_post_id'
  end

  create_table 'logins', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'meetings', force: :cascade do |t|
    t.boolean 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.date 'date'
  end

  create_table 'member_points', force: :cascade do |t|
    t.date 'date'
    t.integer 'points'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'event_id', null: false
    t.bigint 'activity_id', null: false
    t.bigint 'member_id', null: false
    t.index ['activity_id'], name: 'index_member_points_on_activity_id'
    t.index ['event_id'], name: 'index_member_points_on_event_id'
    t.index ['member_id'], name: 'index_member_points_on_member_id'
  end

  create_table 'members', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'isAdmin', default: false
    t.boolean 'isOwner', default: false
    t.integer 'totalPoints', default: 0
    t.string 'email'
    t.string 'uid'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.string 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'member_id', null: false
    t.integer 'likes_count', default: 0
    t.integer 'numlikes', default: 0
    t.index ['member_id'], name: 'index_posts_on_member_id'
  end

  add_foreign_key 'bios', 'members'
  add_foreign_key 'events', 'activities'
  add_foreign_key 'joins', 'meetings'
  add_foreign_key 'joins', 'members'
  add_foreign_key 'likes', 'members'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'member_points', 'activities'
  add_foreign_key 'member_points', 'events'
  add_foreign_key 'member_points', 'members'
  add_foreign_key 'posts', 'members'
end
