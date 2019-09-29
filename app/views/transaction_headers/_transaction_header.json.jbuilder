json.extract! transaction_header, :id, :user, :transaction_date, :account, :supplier, :sign, :reconciled, :total, :created_at, :updated_at
json.url transaction_header_url(transaction_header, format: :json)
