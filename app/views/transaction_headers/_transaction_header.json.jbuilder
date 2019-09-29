json.extract! transaction_header, :id, :user_id, :transaction_date, :account_id, :supplier_id, :sign, :reconciled, :total, :created_at, :updated_at
json.url transaction_header_url(transaction_header, format: :json)
