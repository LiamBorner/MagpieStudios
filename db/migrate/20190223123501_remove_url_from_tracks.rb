class RemoveUrlFromTracks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :url
  end
end
