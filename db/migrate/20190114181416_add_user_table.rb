class AddUserTable < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :bandname
    end 
  end
end
