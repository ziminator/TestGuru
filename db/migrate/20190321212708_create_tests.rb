class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category, foreign_key: true

      t.timestamps
    end
  end

  def self.name_tests(level)
    titles = []
    titles << Test.select(:title).and(Test.where("level = ?", level)).and(Test.order('test DESC'))
  end
end
