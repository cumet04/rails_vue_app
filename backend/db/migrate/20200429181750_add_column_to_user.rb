class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :deleted_at, :datetime, null: true, default: nil

    # 1|NULL instead of 1|0, for unique constraint
    add_column :users, :is_available, :virtual,
               type: :boolean, as: "if(deleted_at is null, 1, null)"

    remove_index :users, column: :email
    add_index :users, [:email, :is_available], unique: true
  end
end
