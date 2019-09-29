json.extract! supplier, :id, :name, :description, :location, :account_id, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
