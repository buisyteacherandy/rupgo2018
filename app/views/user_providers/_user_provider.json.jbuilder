json.extract! user_provider, :id, :user_id, :provider, :uid, :created_at, :updated_at
json.url user_provider_url(user_provider, format: :json)