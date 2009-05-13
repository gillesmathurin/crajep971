# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090513205021) do

  create_table "abonnes", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actions", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.string   "nom_lien"
    t.string   "lien"
    t.integer  "categorie_action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "titre"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "evenement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "candidatures", :force => true do |t|
    t.string   "nom_asso"
    t.string   "adresse"
    t.string   "cp"
    t.string   "ville"
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.string   "nom_contact"
    t.string   "tel_contact"
    t.text     "objet"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mail_contact"
    t.string   "annee_creation"
  end

  create_table "categorie_actions", :force => true do |t|
    t.string   "nom"
    t.text     "theme"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cpte_rendus", :force => true do |t|
    t.string   "titre"
    t.datetime "published_at"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evenements", :force => true do |t|
    t.string   "titre"
    t.date     "date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lieu"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "liens", :force => true do |t|
    t.string   "nom"
    t.string   "adresse"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "membres", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.string   "adresse"
    t.string   "cp"
    t.string   "ville"
    t.string   "tel"
    t.string   "fax"
    t.string   "weburl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "newsletters", :force => true do |t|
    t.datetime "published_at"
    t.string   "titre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nl_contents", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "newsletter_id"
    t.text     "body"
    t.string   "titre"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
    t.string   "categorie"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
