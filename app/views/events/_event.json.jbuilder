json.extract! event, :id, :name, :date, :status, :created_at, :updated_at
json.url event_url(event, format: :json)
