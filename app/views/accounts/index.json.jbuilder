json.array!(@accounts) do |account|
  json.extract! account, :id, :email, :setup, :user_id, :name
  json.url account_url(account, format: :json)
end
