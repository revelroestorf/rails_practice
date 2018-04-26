json.extract! user, :id, :name, :address, :phone, :email, :balance, :created_at, :updated_at
json.url user_url(user, format: :json)
