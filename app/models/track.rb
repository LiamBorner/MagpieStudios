class Track < ApplicationRecord

    belongs_to :user
    has_one_attached :track_file

    def track_path
        ActiveStorage::Blob.service.path_for(track.key)
      end

end
