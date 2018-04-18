json.extract! contact, :id, :name, :phone, :street, :city, :state, :postcode, :created_at, :updated_at
json.url contact_url(contact, format: :json)
