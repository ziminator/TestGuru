class AddNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:categories, :category, false)
    change_column_null(:users, :first_name, false)
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :question, false)
    change_column_null(:answers, :answer, false)
  end
end
