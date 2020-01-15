json.extract! event, :id, :title, :description, :min_deg, :created_at, :updated_at
json.url event_url(event, format: :json)
