class CreateUserTestRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_test_relations do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
