class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer, null: false
      t.boolean :correct, default: false, null: false
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
