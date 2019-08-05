class AddUserIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :user_id, :integer, null: false
    #add_reference :tests, :user, foreign_key: {to_table: :users}
    #add_reference :tests, :author, foreign_key: {to_table: :users}
    #add_column :tests, :user_id, :integer, index: true
    #add_column :tests, :author_id, :integer, index: true
    #add_reference :tests, :user
    #add_reference :tests, :author
  end
end
