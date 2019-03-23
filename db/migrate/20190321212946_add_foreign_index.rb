class AddForeignIndex < ActiveRecord::Migration[5.2]
  def change
    add_reference(:answers, :questions, foreign_key: {to_table: :questions})
    add_reference(:questions, :tests, foreign_key: {to_table: :tests})
    add_reference(:tests, :categories, foreign_key: {to_table: :categories})
  end
end
