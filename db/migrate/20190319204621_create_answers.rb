class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer
      t.string :correct

      t.timestamps
    end
  end
end
