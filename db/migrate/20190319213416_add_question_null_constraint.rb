class AddQuestionNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:questions, :question, false)
  end
end
