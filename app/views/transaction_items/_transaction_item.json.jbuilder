json.extract! transaction_item, :id, :category_id, :amount, :description, :transaction_header_id, :created_at, :updated_at
json.url transaction_item_url(transaction_item, format: :json)
