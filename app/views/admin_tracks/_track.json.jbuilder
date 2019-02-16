json.extract! track, :id, :title, :url, :created_at, :updated_at
json.url track_url(track, format: :json)
