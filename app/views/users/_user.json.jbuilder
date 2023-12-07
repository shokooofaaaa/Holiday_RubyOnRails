json.extract! user, :id, : name, :lastName, :created_at, :updated_at
json.url user_url(user, format: :json)
