class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.datetime :deleted_at, null: true, default: nil
      t.virtual :is_available, type: :boolean, as: "if(deleted_at is null, 1, null)"

      t.timestamps
    end
    add_index :posts, [:title]
  end
end
