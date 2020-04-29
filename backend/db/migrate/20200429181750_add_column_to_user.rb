class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :deleted_at, :datetime, null: true, default: nil
  end
end
