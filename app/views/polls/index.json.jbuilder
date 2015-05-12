json.array!(@polls) do |poll|
  json.extract! poll, :id, :topic, :description, :expires, :active, :created_at, :updated_at
  json.url poll_url(poll, format: :json)
end
