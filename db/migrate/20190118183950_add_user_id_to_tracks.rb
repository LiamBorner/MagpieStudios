class AddUserIdToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :user_id, :integer
    add_index :tracks, :user_id
  end
end
