class AddUserIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :user_id, :bigint, null: true
  end
end
