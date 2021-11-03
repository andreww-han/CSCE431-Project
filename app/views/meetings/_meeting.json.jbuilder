json.extract! meeting, :id, :status, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
