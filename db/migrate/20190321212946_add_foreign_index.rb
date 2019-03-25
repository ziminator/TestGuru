class AddForeignIndex < ActiveRecord::Migration[5.2]
  def change
    add_reference(:answers, :questions, foreign_key: {to_table: :questions})
    add_reference(:questions, :tests, foreign_key: {to_table: :tests})
    add_reference(:tests, :categories, foreign_key: {to_table: :categories})
    add_reference(:user_test_relations, :users, foreign_key: {to_table: :users})
    add_reference(:user_test_relations, :tests, foreign_key: {to_table: :tests})
  end
end
