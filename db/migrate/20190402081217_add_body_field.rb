class AddBodyField < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :body, :string
  end
end
