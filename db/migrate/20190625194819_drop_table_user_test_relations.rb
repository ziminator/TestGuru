class DropTableUserTestRelations < ActiveRecord::Migration[5.2]
  def up
    drop_table :user_test_relations, if_exist: true
  end
end
