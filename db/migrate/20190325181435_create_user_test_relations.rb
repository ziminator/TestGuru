class CreateUserTestRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_test_relations do |t|

      t.timestamps
    end
  end
end
