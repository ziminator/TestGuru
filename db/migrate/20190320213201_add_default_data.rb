class AddDefaultData < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :level, true
    change_column_default :answers, :correct, 'Ответ верен'
  end
end
