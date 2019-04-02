class RemoveBodyFromQuetions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :body, :string
  end
end
