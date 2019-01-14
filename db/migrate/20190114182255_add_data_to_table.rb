class AddDataToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :username, :string
  end
end
