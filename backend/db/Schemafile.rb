# -*- mode: ruby -*-
# vi: set ft=ruby :
create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  t.string "title", null: false
  t.text "content"
  t.bigint "author_id", null: false
  t.datetime "deleted_at"
  t.virtual "is_available", type: :boolean, as: "if(`deleted_at` is null,1,NULL)"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
  t.index ["author_id"], name: "index_posts_on_author_id"
  t.index ["title"], name: "index_posts_on_title"
end

create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  t.string "email", null: false
  t.string "encrypted_password", null: false
  t.string "name", null: false
  t.text "biography"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
  t.datetime "deleted_at"
  t.virtual "is_available", type: :boolean, as: "if(`deleted_at` is null,1,NULL)"
  t.index ["email", "is_available"], name: "index_users_on_email_and_is_available", unique: true
end

add_foreign_key "posts", "users", column: "author_id"
