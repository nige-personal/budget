json.extract! account_user, :id, :account_id, :user_id, :privilege, :created_at, :updated_at
json.url account_user_url(account_user, format: :json)
