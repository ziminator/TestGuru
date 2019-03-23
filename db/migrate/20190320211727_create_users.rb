class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user

      t.timestamps
    end
  end

  def get_level(level)
    tests = []
    tests << Test.select(:title).and(Test.where("level = ?", level))
  end
end
